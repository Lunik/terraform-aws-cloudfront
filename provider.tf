
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.56"
    }
  }
}

provider "aws" {
  alias  = "cloudfront"
  region = "us-east-1"
}