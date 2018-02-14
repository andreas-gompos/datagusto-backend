
resource "aws_instance" "ec2_server" {
  count           = "1"
  ami             = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type   = "${var.INSTANCE_TYPE}"
  key_name        = "serving_ai"
  vpc_security_group_ids = ["${aws_security_group.serving_ai_sg.id}"]
  subnet_id = "${aws_subnet.serving_ai_subnet.id}"

  tags {
    Name = "serving_ai_server"
  }

  connection {
    user        = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = "${aws_instance.ec2_server.id}"
  allocation_id = "${data.terraform_remote_state.server_ai_tf_state.server_ai_eip_id}"
}

resource "aws_volume_attachment" "serving_ai_ebs_attachment" {
  device_name = "/dev/xvdh"
  volume_id   = "${data.terraform_remote_state.server_ai_tf_state.serving_ai_ebs_id}" 
  instance_id = "${aws_instance.ec2_server.id}"

  provisioner "remote-exec" {
  inline = [
    "sudo mkfs -t ext4 /dev/xvdh",
    "sudo mkdir /data",
    "sudo mount /dev/xvdh /data",
    "sudo chmod -R 777 /data",
  ]
}

  connection {
    host        = "${data.terraform_remote_state.server_ai_tf_state.server_ai_eip_public_ip}"
    user        = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
}