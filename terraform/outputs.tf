output "bastion-ip" {
  value = aws_instance.bastion.public_ip
}

output "private-ip" {
  value = aws_instance.ec2.private_ip
}
