
resource "aws_cloudfront_function" "redirect-slash-to-index" {
  name    = "redirect-slash-to-index-${replace(var.domain_name, ".", "_")}"
  comment = "Redirect HTTP requests from '.*/' to '.*/index.html'"

  runtime = "cloudfront-js-1.0"
  code    = file("${path.module}/code/redirect-slash-to-index-function.js")

  publish = true
}