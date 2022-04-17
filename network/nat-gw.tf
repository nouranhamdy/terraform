resource "aws_eip" "nateIP" {
   vpc   = true
 }

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nateIP.id
  subnet_id     = aws_subnet.pub-subnet-01.id

  tags = {
    Name = "nat-gw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw-01]
}