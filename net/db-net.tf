resource "aws_subnet" "subnet-db1" {
  assign_ipv6_address_on_creation = false
  availability_zone               = data.aws_availability_zones.az.names[0]
  cidr_block                      = var.subnet-db1
  map_public_ip_on_launch         = false
  tags = {
    "Name"                                                                      = "DB1"
    # "kubernetes.io/cluster/${data.aws_ssm_parameter.tf-eks-cluster-name.value}" = "shared"
    # "kubernetes.io/role/internal-elb"                                           = "1"
    "workshop"                                                                  = "subnet-db1"
  }
  vpc_id = aws_vpc.cluster.id

  timeouts {}
}

resource "aws_subnet" "subnet-db2" {
  assign_ipv6_address_on_creation = false
  availability_zone               = data.aws_availability_zones.az.names[1]
  cidr_block                      = var.subnet-db2
  map_public_ip_on_launch         = false
  tags = {
    "Name"                                                                      = "DB2"
    # "kubernetes.io/cluster/${data.aws_ssm_parameter.tf-eks-cluster-name.value}" = "shared"
    # "kubernetes.io/role/internal-elb"                                           = "1"
    "workshop"                                                                  = "subnet-db2"
  }
  vpc_id = aws_vpc.cluster.id

  timeouts {}
}

resource "aws_subnet" "subnet-db3" {
  assign_ipv6_address_on_creation = false
  availability_zone               = data.aws_availability_zones.az.names[2]
  cidr_block                      = var.subnet-db3
  map_public_ip_on_launch         = false
  tags = {
    "Name"                                                                      = "DB3"
    # "kubernetes.io/cluster/${data.aws_ssm_parameter.tf-eks-cluster-name.value}" = "shared"
    # "kubernetes.io/role/internal-elb"                                           = "1"
    "workshop"                                                                  = "subnet-db3"
  }
  vpc_id = aws_vpc.cluster.id

  timeouts {}
}

resource "aws_route_table" "rtb-db" {
  propagating_vgws = []
  route = [
    {
      carrier_gateway_id         = ""
      cidr_block                 = "0.0.0.0/0"
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      gateway_id                 = ""
      instance_id                = null
      ipv6_cidr_block            = null
      local_gateway_id           = ""
      nat_gateway_id             = aws_nat_gateway.nat-eks.id
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_peering_connection_id  = ""
      vpc_endpoint_id            = ""
      core_network_arn           = ""
    },
      {
    carrier_gateway_id         = ""
    cidr_block                 = "172.31.0.0/16"
    destination_prefix_list_id = ""
    egress_only_gateway_id     = ""
    gateway_id                 = ""
    instance_id                = null
    ipv6_cidr_block            = null
    local_gateway_id           = ""
    nat_gateway_id             = ""
    network_interface_id       = ""
    transit_gateway_id         = ""
    vpc_peering_connection_id  = aws_vpc_peering_connection.def-peer.id
    vpc_endpoint_id            = ""
    core_network_arn           = ""
  },
  ]
  tags = {
    "Name" = "eks-cluster/PrivateRouteTableEUWEST1ADB"

  }
  vpc_id = aws_vpc.cluster.id
}

resource "aws_route_table_association" "rtbassoc-db1" {
  route_table_id = aws_route_table.rtb-db.id
  subnet_id      = aws_subnet.subnet-db1.id
}

resource "aws_route_table_association" "rtbassoc-db2" {
  route_table_id = aws_route_table.rtb-db.id
  subnet_id      = aws_subnet.subnet-db2.id
}

resource "aws_route_table_association" "rtbassoc-db3" {
  route_table_id = aws_route_table.rtb-db.id
  subnet_id      = aws_subnet.subnet-db3.id
}

resource "aws_db_subnet_group" "priv" {
  name       = "db_subnets"
  subnet_ids = [aws_subnet.subnet-db1.id, aws_subnet.subnet-db2.id, aws_subnet.subnet-db3.id]

  tags = {
    Name = "Public DB subnets"
  }
}

resource "aws_security_group" "db-sg" {
  description = "DB Security group"
  vpc_id      = aws_vpc.cluster.id
  tags = {
    "Name"  = format("eks-%s-cluster/DataBaseSecurityGroup", data.aws_ssm_parameter.tf-eks-cluster-name.value)
    "Label" = "TF-EKS Control Plane & all worker nodes comms"
  }
}
resource "aws_security_group_rule" "sg-ingress-rules-db" {
  security_group_id = aws_security_group.db-sg.id
  from_port         = 5432
  protocol          = "tcp"
  to_port           = 5432
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}
resource "aws_ssm_parameter" "db-sg" {
  name        = "/${var.environment}/tf-eks/db-sg"
  description = "The cluster all node group id"
  type        = "String"
  value = aws_security_group.db-sg.id
  tags = {
    workshop = "tf-eks-workshop"
  }
}
