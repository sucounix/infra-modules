resource "aws_eip" "eipalloc-eks-pub" {
  public_ipv4_pool = "amazon"
  tags             = {}
  domain           = "vpc"
  timeouts {}
}

resource "aws_internet_gateway" "igw-eks-pub" {
  tags = {
    "Name" = format("igw-%s", data.aws_ssm_parameter.tf-eks-cluster-name.value)
  }
  vpc_id = aws_vpc.cluster.id
}
resource "aws_nat_gateway" "nat-eks" {
  depends_on = [ aws_internet_gateway.igw-eks-pub ]
  allocation_id = aws_eip.eipalloc-eks-pub.id
  subnet_id     = aws_subnet.subnet-pub1.id
  tags = {
    "Name" = format("nat-%s", data.aws_ssm_parameter.tf-eks-cluster-name.value)
  }
}


resource "aws_route_table" "rtb-pub" {
  propagating_vgws = []
  route = [
    {
      carrier_gateway_id         = ""
      cidr_block                 = "0.0.0.0/0"
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      gateway_id                 = aws_internet_gateway.igw-eks-pub.id
      instance_id                = null
      ipv6_cidr_block            = null
      local_gateway_id           = ""
      nat_gateway_id             = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_peering_connection_id  = ""
      vpc_endpoint_id            = ""
      core_network_arn           = ""
    },
  ]
  tags = {
    "Name" = "rtb-eks-pub"
  }
  vpc_id = aws_vpc.cluster.id
}

resource "aws_route_table_association" "rtbassoc-public1" {
  route_table_id = aws_route_table.rtb-pub.id
  subnet_id      = aws_subnet.subnet-pub1.id
}

resource "aws_route_table_association" "rtbassoc-public2" {
  route_table_id = aws_route_table.rtb-pub.id
  subnet_id      = aws_subnet.subnet-pub2.id
}

resource "aws_route_table_association" "rtbassoc-public3" {
  route_table_id = aws_route_table.rtb-pub.id
  subnet_id      = aws_subnet.subnet-pub3.id
}
