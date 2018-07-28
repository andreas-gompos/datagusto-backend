provider "aws" {
  profile     = "${var.AWS_PROFILE}"
  region     = "${var.AWS_REGION}"
}

provider "aws" {
    region = "eu-west-2"
    alias = "london"
}
