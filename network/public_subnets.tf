resource "aws_subnet" "pub-subnet-01" {
  vpc_id     = aws_vpc.vpc-01.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "pub-subnet-01"
  }
}

resource "aws_subnet" "pub-subnet-02" {
  vpc_id     = aws_vpc.vpc-01.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "${var.region}b"
  map_public_ip_on_launch = true

  tags = {
    Name = "pub-subnet-02"
  }
}