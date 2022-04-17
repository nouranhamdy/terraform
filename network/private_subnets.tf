resource "aws_subnet" "private-subnet-01" {
  vpc_id     = aws_vpc.vpc-01.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name = "pub-subnet-01"
  }
}

resource "aws_subnet" "private-subnet-02" {
  vpc_id     = aws_vpc.vpc-01.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "${var.region}b"

  tags = {
    Name = "pub-subnet-02"
  }
}