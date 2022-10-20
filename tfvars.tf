variable "amis" {
  type = map(string)

  default = {
    "us-east-1" = "ami-052efd3df9dad4825"
    "us-east-2" = "ami-0568773882d492fc8"
  }
}

variable "cidr_access" {
  type = list

  default = ["177.131.133.120/32"]
}

variable "key_name" {
  default = "terraform-aws"
}