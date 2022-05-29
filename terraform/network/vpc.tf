resource "aws_vpc" "vpc-01" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc-01"
  }
}

resource "aws_route_table" "default-route" {
  vpc_id = aws_vpc.vpc-01.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-01.id
  }

  tags = {
    Name = "default-route"
  }
}

resource "aws_main_route_table_association" "a" {
  vpc_id         = aws_vpc.vpc-01.id
  route_table_id = aws_route_table.default-route.id
}
