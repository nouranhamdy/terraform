output "vpc-id" {
  value = aws_vpc.vpc-01.id
}

output "private-subnet-01-id" {
  value = aws_subnet.private-subnet-01.id
}

output "private-subnet-02-id" {
  value = aws_subnet.private-subnet-02.id
}

output "public-subnet-01-id" {
  value = aws_subnet.pub-subnet-01.id
}

output "public-subnet-02-id" {
  value = aws_subnet.pub-subnet-02.id
}

output "vpc-cidr-block" {
  value =aws_vpc.vpc-01.cidr_block 
}
