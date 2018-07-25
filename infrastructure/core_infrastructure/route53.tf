resource "aws_route53_zone" "datagusto" {
  name = "datagusto.com"
  comment = "taste what data can do"
}

resource "aws_route53_record" "datagusto_main_www" {
  zone_id = "${aws_route53_zone.datagusto.zone_id}"
  name    = "www.datagusto.com"
  type    = "A"
  ttl     = "300"
  records = ["${aws_eip.serving_ai_eip.public_ip}"]
}

resource "aws_route53_record" "datagusto_main_no_www" {
  zone_id = "${aws_route53_zone.datagusto.zone_id}"
  name    = "datagusto.com"
  type    = "A"

  alias {
    name                   = "www.datagusto.com"
    zone_id                = "${aws_route53_zone.datagusto.zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "subdomain_jenkins" {
  zone_id = "${aws_route53_zone.datagusto.zone_id}"
  name    = "jenkins.datagusto.com"
  type    = "A"
  ttl     = "300"
  records = ["${aws_eip.serving_ai_eip.public_ip}"]
}

resource "aws_route53_record" "subdomain_engine" {
  zone_id = "${aws_route53_zone.datagusto.zone_id}"
  name    = "engine.datagusto.com"
  type    = "A"
  ttl     = "300"
  records = ["${aws_eip.serving_ai_eip.public_ip}"]
}

resource "aws_route53_record" "subdomain_models" {
  zone_id = "${aws_route53_zone.datagusto.zone_id}"
  name    = "topic_classification.models.datagusto.com"
  type    = "A"
  ttl     = "300"
  records = ["${aws_eip.serving_ai_eip.public_ip}"]
}
