resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "Configura o acesso SSH"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.cidr_access
  }

  tags = {
    Name = "Acesso-SSH"
  }
}

resource "aws_security_group" "acesso-ssh-us-east-2" {
  provider = aws.us-east-2
  name        = "acesso-ssh-us-east-2"
  description = "Configura o acesso SSH"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = "${var.cidr_access}"
  }

  tags = {
    Name = "Acesso-SSH"
  }
}