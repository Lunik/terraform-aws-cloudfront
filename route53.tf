
data "aws_route53_zone" "website_domain_zone" {
  count = var.domain_validation_method == "DNS" ? 1 : 0

  name         = var.aws_route53_zone_name
}

resource "aws_route53_record" "cert_dns_validation" {
  count = var.domain_validation_method == "DNS" ? 1 : 0

  zone_id = one(data.aws_route53_zone.website_domain_zone).id

  type    = one(aws_acm_certificate.website_cert.domain_validation_options).resource_record_type

  name    = one(aws_acm_certificate.website_cert.domain_validation_options).resource_record_name

  records = [one(aws_acm_certificate.website_cert.domain_validation_options).resource_record_value]

  ttl     = 60
}