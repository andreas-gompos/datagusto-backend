resource "aws_instance" "serving_ai_server_ec2" {
  count           = "1"
  ami             = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type   = "${var.INSTANCE_TYPE}"
  key_name        = "serving_ai"
  vpc_security_group_ids = ["${aws_security_group.serving_ai_server_sg.id}"]
  subnet_id = "${aws_subnet.serving_ai_server_subnet.id}"

  tags {
    Name = "serving_ai_server"
  }


  provisioner "local-exec" {
     command = "printf '[local_machines]\nlocal_machine ansible_connection=local\n\n[remote_machines:vars]\nansible_private_key_file=~/.ssh/serving_ai.pem\nansible_python_interpreter=/usr/bin/python3\n\n[remote_machines]\nserving_ai_server ansible_host=${aws_instance.serving_ai_server_ec2.public_ip} ansible_user=${var.INSTANCE_USERNAME}' > ../ansible/dev"
}
  connection {
    user        = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
}