resource "aws_route53_zone" "datagusto" {
  name = "datagusto.com"
  comment = "taste what data can do"
}

resource "aws_route53_record" "datagusto_com" {
  zone_id = "${aws_route53_zone.datagusto.zone_id}"
  name    = "datagusto.com"
  type    = "A"

  alias {
    name                   = "${aws_s3_bucket.datagusto_com.website_domain}"
    zone_id                = "${aws_s3_bucket.datagusto_com.hosted_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www_datagusto_com" {
  zone_id = "${aws_route53_zone.datagusto.zone_id}"
  name    = "www.datagusto.com"
  type    = "A"

  alias {
    name                   = "${aws_s3_bucket.www_datagusto_com.website_domain}"
    zone_id                = "${aws_s3_bucket.www_datagusto_com.hosted_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "subdomain_models" {
  zone_id = "${aws_route53_zone.datagusto.zone_id}"
  name    = "models.datagusto.com"
  type    = "A"
  ttl     = "300"
  records = ["${aws_eip.serving_ai_eip.public_ip}"]
}

resource "aws_route53_record" "subdomain_models_topic_classification" {
  zone_id = "${aws_route53_zone.datagusto.zone_id}"
  name    = "topic_classification.models.datagusto.com"
  type    = "A"
  ttl     = "300"
  records = ["${aws_eip.serving_ai_eip.public_ip}"]
}
