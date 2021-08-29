
variable "domain_name" {
  type = string
  description = "Website domain name."
}

variable "domain_alt_name" {
  type = list(string)
  description = "Website domain alternative names."
  default = []
}

variable "domain_validation_method" {
  type = string
  description = "Which method to use for verifying domain name."
  default = "DNS"
}

variable "certificate_tags" {
  type = map(string)
  description = "Map of tags attached to the website certificate."
  default     = {}
}

variable "aws_route53_zone_name" {
  type = string
  description = "Name of the route53 zone."
}

variable "aws_s3_bucket" {
  type = any
  description = "AWS S3 Bucket object storing static files."
}

variable "cloudfront_price_class" {
  type = string
  description = "The price class for the cloudfront distribution."
  default = "PriceClass_100"
}

variable "cloudfront_http_version" {
  type = string
  description = "The maximum HTTP version to support on the cloudfront distribution."
  default = "http2"
}

variable "cloudfront_ipv6_enabled" {
  type = bool
  description = "Whether the IPv6 is enabled for the cloudfront distribution."
  default = true
}

variable "cloudfront_tags" {
  type = map(string)
  description = "Map of tags attached to the website cloudfront."
  default     = {}
}

variable "cloudfront_index_file_name" {
  type        = string
  description = "Default index file name of the website."
  default     = "index.html"
}