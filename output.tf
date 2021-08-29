
output "cloudfront_oai" {
  description = "Cloudfront terraform object."
  value       = aws_cloudfront_origin_access_identity.origin_access_identity
}

output "cloudfront" {
  description = "Cloudfront terraform object."
  value       = aws_cloudfront_distribution.website_cdn
}

output "certificate" {
  description = "Certificate terraform object."
  value       = aws_acm_certificate.website_cert
}