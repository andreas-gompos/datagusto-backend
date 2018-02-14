resource "aws_eip" "serving_ai_eip" {
  vpc      = true

  tags {
    Name = "serving_ai_eip"
  }
}

