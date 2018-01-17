variable "AWS_REGION" {
  default = "us-east-1"
}

variable "INSTANCE_TYPE" {
  default = "t2.micro"
}

variable "AMIS" {
  type = "map"

  default = {
    eu-west-2 = "ami-d7aab2b3"
    eu-west-1 = "ami-4d46d534"
    us-east-1 = "ami-41e0b93b"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "~/.ssh/serving_ai.pem"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}