terraform {
	backend "s3" {
	bucket = "datagusto-terraform-states"
	key = "serving_ai/ec2_server/tf_state"
	region = "us-east-1"
	}
}
