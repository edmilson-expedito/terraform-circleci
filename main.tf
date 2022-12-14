provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias = "us-east-2"
  region = "us-east-2"
}

resource "aws_instance" "dev" {
  count = 1
  ami = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  tags = {
    "name" = "dev_${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "dev5" {
  ami = var.amis.us-east-1
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  tags = {
    "name" = "dev5"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "dev6" {
  provider = aws.us-east-2
  ami = var.amis.us-east-2
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  tags = {
    "name" = "dev6"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"]
  depends_on = [aws_dynamodb_table.dynamodb-homolog]
}

resource "aws_instance" "dev7" {
  provider = aws.us-east-2
  ami = var.amis.us-east-2
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  tags = {
    "name" = "dev7"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"]
  depends_on = [aws_dynamodb_table.dynamodb-homolog]
}