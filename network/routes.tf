resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.route-01.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw-01.id
}

# Add route for private route table to nat gateway
resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.route-02.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat-gw.id
}

resource "aws_egress_only_internet_gateway" "egress" {
  vpc_id = aws_vpc.vpc-01.id
}