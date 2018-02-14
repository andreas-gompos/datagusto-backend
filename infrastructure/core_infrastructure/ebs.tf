resource "aws_ebs_volume" "serving_ai_ebs" {
  availability_zone = "us-east-1a"
  size              = "1"
  type              = "gp2"
  tags {
    Name = "serving_ai_ebs"
  }

}

