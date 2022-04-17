resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.pub-subnet-01.id
  route_table_id = aws_route_table.route-01.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.pub-subnet-02.id
  route_table_id = aws_route_table.route-01.id
}


resource "aws_route_table" "route-01" {
  vpc_id = aws_vpc.vpc-01.id

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.egress.id
  }

  tags = {
    Name = "route-01"
  }
}

