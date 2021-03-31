terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  profile   = "default"
  region    = "us-east-2"
}

resource "aws_s3_bucket" "deployer-s3" {
  bucket = "deployer"
  acl = "private"
  tags = {
    Application = "Deployer"
  }

  versioning {
    enabled = true
  }
}