resource "aws_acm_certificate" "website_cert" {
  provider = aws.cloudfront

  domain_name = var.domain_name

  subject_alternative_names = var.domain_alt_name

  validation_method = var.domain_validation_method

  tags = var.certificate_tags
}

resource "aws_acm_certificate_validation" "website_cert" {
  provider = aws.cloudfront

  certificate_arn         = aws_acm_certificate.website_cert.arn
  validation_record_fqdns = [one(aws_route53_record.cert_dns_validation).fqdn]
}
