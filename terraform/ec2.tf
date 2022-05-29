resource "aws_instance" "ec2" {
  ami           = var.ami # us-west-2
  instance_type = "t2.micro"
  key_name = "key-pair"

  network_interface {
    network_interface_id = aws_network_interface.nic-ec2.id
    device_index         = 0
  }

  tags = {
    Name = "private-instance"
  }

}

resource "aws_network_interface" "nic-ec2" {
  subnet_id       = module.network.private-subnet-01-id
  private_ips     = ["10.0.1.20"]
  security_groups = [aws_security_group.sgr-ssh-8000.id]

}

