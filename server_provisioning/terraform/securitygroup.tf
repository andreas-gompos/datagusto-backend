resource "aws_security_group" "serving_ai_server_sg" {
  vpc_id = "${aws_vpc.serving_ai_vpc.id}"
  name = "serving_ai_server_sg"
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
      cidr_blocks = ["2.28.152.87/32"]
  } 

  tags {
      Name = "serving_ai_server_sg"
  }
}