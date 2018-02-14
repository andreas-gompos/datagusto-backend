data "terraform_remote_state" "server_ai_tf_state" {
  backend = "s3"
  config {
    bucket = "datagusto-terraform-states"
    key = "serving_ai/core_infrastructure/tf_state"
    region = "us-east-1"
  }
}