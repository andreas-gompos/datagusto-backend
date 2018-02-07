resource "aws_s3_bucket" "serving_ai_bucket" {
  bucket = "datagusto-serving-ai"
  acl    = "private"

  tags {
    Name        = "serving ai bucket"
  }
}
