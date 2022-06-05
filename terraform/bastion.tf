resource "aws_instance" "bastion" {
  ami           = var.ami # us-west-2
  instance_type = "t2.micro"
  key_name = aws_key_pair.public_key.key_name
  provisioner "local-exec" {
    command = "echo ${self.public_ip}"
  } 

  network_interface {
    network_interface_id = aws_network_interface.nic.id
    device_index         = 0
  }

  tags = {
    Name = "bastion"
  }

}

resource "aws_network_interface" "nic" {
  subnet_id       = module.network.public-subnet-01-id
  private_ips     = ["10.0.0.50"]
  security_groups = [aws_security_group.sgr-ssh.id]
}

