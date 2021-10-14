
resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "CloudFront OAI ${var.domain_name}"
}

resource "aws_cloudfront_distribution" "website_cdn" {
  enabled      = true
  price_class  = var.cloudfront_price_class
  http_version = var.cloudfront_http_version
  is_ipv6_enabled     = var.cloudfront_ipv6_enabled

  tags = var.cloudfront_tags

  aliases = [var.domain_name]

  default_root_object = var.cloudfront_index_file_name
  origin {
    origin_id   = var.aws_s3_bucket.id
    domain_name = var.aws_s3_bucket.bucket_domain_name

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
    }
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.aws_s3_bucket.id

    min_ttl                = "0"
    default_ttl            = "300"
    max_ttl                = "1200"
    viewer_protocol_policy = "redirect-to-https"
    compress               = true

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    function_association {
      event_type   = "viewer-request"
      function_arn = aws_cloudfront_function.redirect-slash-to-index.arn
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn = aws_acm_certificate_validation.website_cert.certificate_arn
    ssl_support_method  = "sni-only"

    minimum_protocol_version = "TLSv1.2_2021"
  }
}
