## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.56 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.56 |
| <a name="provider_aws.cloudfront"></a> [aws.cloudfront](#provider\_aws.cloudfront) | ~> 3.56 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.website_cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.website_cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_cloudfront_distribution.website_cdn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_origin_access_identity.origin_access_identity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_identity) | resource |
| [aws_route53_record.cert_dns_validation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.website_domain_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_route53_zone_name"></a> [aws\_route53\_zone\_name](#input\_aws\_route53\_zone\_name) | Name of the route53 zone. | `string` | n/a | yes |
| <a name="input_aws_s3_bucket"></a> [aws\_s3\_bucket](#input\_aws\_s3\_bucket) | AWS S3 Bucket object storing static files. | `any` | n/a | yes |
| <a name="input_certificate_tags"></a> [certificate\_tags](#input\_certificate\_tags) | Map of tags attached to the website certificate. | `map(string)` | `{}` | no |
| <a name="input_cloudfront_http_version"></a> [cloudfront\_http\_version](#input\_cloudfront\_http\_version) | The maximum HTTP version to support on the cloudfront distribution. | `string` | `"http2"` | no |
| <a name="input_cloudfront_index_file_name"></a> [cloudfront\_index\_file\_name](#input\_cloudfront\_index\_file\_name) | Default index file name of the website. | `string` | `"index.html"` | no |
| <a name="input_cloudfront_ipv6_enabled"></a> [cloudfront\_ipv6\_enabled](#input\_cloudfront\_ipv6\_enabled) | Whether the IPv6 is enabled for the cloudfront distribution. | `bool` | `true` | no |
| <a name="input_cloudfront_price_class"></a> [cloudfront\_price\_class](#input\_cloudfront\_price\_class) | The price class for the cloudfront distribution. | `string` | `"PriceClass_100"` | no |
| <a name="input_cloudfront_tags"></a> [cloudfront\_tags](#input\_cloudfront\_tags) | Map of tags attached to the website cloudfront. | `map(string)` | `{}` | no |
| <a name="input_domain_alt_name"></a> [domain\_alt\_name](#input\_domain\_alt\_name) | Website domain alternative names. | `list(string)` | `[]` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Website domain name. | `string` | n/a | yes |
| <a name="input_domain_validation_method"></a> [domain\_validation\_method](#input\_domain\_validation\_method) | Which method to use for verifying domain name. | `string` | `"DNS"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate"></a> [certificate](#output\_certificate) | Certificate terraform object. |
| <a name="output_cloudfront"></a> [cloudfront](#output\_cloudfront) | Cloudfront terraform object. |
| <a name="output_cloudfront_oai"></a> [cloudfront\_oai](#output\_cloudfront\_oai) | Cloudfront terraform object. |
