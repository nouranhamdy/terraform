resource "aws_route_table_association" "pb" {
  subnet_id      = aws_subnet.private-subnet-01.id
  route_table_id = aws_route_table.route-02.id
}


resource "aws_route_table" "route-02" {
  vpc_id = aws_vpc.vpc-01.id

  tags = {
    Name = "route-02"
  }
}