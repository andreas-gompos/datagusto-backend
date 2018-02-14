output "server_ai_eip_id" {
  value = "${aws_eip.serving_ai_eip.id}"
}

output "server_ai_eip_public_ip" {
  value = "${aws_eip.serving_ai_eip.public_ip}"
}

output "serving_ai_ebs_id" {
  value = "${aws_ebs_volume.serving_ai_ebs.id}"
}