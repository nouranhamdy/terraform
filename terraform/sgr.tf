resource "aws_security_group" "sgr-ssh" {
  name        = "allow_ssh_for_all"
  description = "Allow ssh inbound traffic"
  vpc_id      = module.network.vpc-id

  ingress {
    description      = "ssh from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "sgr-ssh"
  }
}


resource "aws_security_group" "sgr-ssh-8000" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = module.network.vpc-id

  ingress {
    description      = "ssh from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [module.network.vpc-cidr-block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [module.network.vpc-cidr-block]
  }

  tags = {
    Name = "sgr-ssh-8000"
  }
}

resource "aws_security_group" "DB-test" {
  name        = "DB-SG"
  description = "DB"
  vpc_id      = module.network.vpc-id

  ingress {
    description      = "Allow all"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [module.network.vpc-cidr-block]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.region}-SG-DB"
  }
}

