resource "aws_s3_bucket" "datagusto_playground_bucket" {
  bucket = "datagusto-playground"
  acl    = "private"
  tags {
    Name        = "datagusto playground bucket"
  }
}

resource "aws_s3_bucket" "datagusto_com" {
  provider = "aws.london"
  bucket = "datagusto.com"
  region = "eu-west-2"
  acl    = "public-read"
  policy = "${file("./files/public_bucket_policy.json")}"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
  tags {
    Name        = "datagusto bucket"
  }
}

resource "aws_s3_bucket" "www_datagusto_com" {
  provider = "aws.london"
  bucket = "www.datagusto.com"
  region = "eu-west-2"
  website {
    redirect_all_requests_to = "datagusto.com"
  }
  tags {
    Name        = "datagusto bucket"
  }
}

resource "aws_s3_bucket" "datagusto" {
  provider = "aws.london"
  bucket = "datagusto"
  region = "eu-west-2"

  tags {
    Name        = "datagusto bucket"
  }
}
