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
  bucket = "jjpaters-deployer"
  acl = "private"
  tags = {
    Application = "Deployer"
  }

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_public_access_block" "deployer-s3" {
  bucket = aws_s3_bucket.deployer-s3.id
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}