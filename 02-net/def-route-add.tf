resource "aws_route" "rt-def" {
  route_table_id            = data.aws_vpc.vpc-default.main_route_table_id
  destination_cidr_block    = aws_vpc.cluster.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.def-peer.id
}