resource "aws_s3_bucket" "serving_ai_bucket" {
  bucket = "datagusto-serving-ai"
  acl    = "private"

  tags {
    Name        = "serving ai bucket"
  }
}

resource "aws_s3_bucket" "datagusto_playground_bucket" {
  bucket = "datagusto-playground"
  acl    = "private"

  tags {
    Name        = "datagusto playground bucket"
  }
}