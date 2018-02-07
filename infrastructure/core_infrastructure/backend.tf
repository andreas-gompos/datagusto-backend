terraform {
	backend "s3" {
	bucket = "datagusto-terraform-states"
	key = "serving_ai/core_infrastructure/tf_state"
	region = "us-east-1"
	}
}
