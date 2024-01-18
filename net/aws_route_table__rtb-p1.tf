# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_route_table.rtb-041267f0474c24068:
resource "aws_route_table" "rtb-p1" {
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
    "Name" = "eks-cluster/PrivateRouteTableEUWEST1A"

  }
  vpc_id = aws_vpc.cluster.id
}
