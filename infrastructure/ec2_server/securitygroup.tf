resource "aws_security_group" "serving_ai_sg" {
  vpc_id = "${aws_vpc.serving_ai_vpc.id}"
  name = "serving_ai_sg"
  description = "security group for serving_ai server"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  } 

  ingress {
      from_port = 8080
      to_port = 8080
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  } 

  ingress {
      from_port = 50000
      to_port = 50000
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  } 

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  } 

  tags {
      Name = "serving_ai_sg"
  }
}