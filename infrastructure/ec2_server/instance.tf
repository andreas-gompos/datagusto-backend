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

resource "aws_eip" "serving_ai_eip" {
  instance = "${aws_instance.ec2_server.id}"
  vpc      = true

  tags {
    Name = "serving_ai_eip"
  }
}
