variable "AWS_REGION" {
  default = "us-east-1"
}

variable "INSTANCE_TYPE" {
  default = "t2.micro"
}

variable "AMIS" {
  type = "map"

  default = {
    us-east-1 = "ami-66506c1c"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "~/.ssh/serving_ai.pem"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}