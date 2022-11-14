terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
resource "aws_s3_bucket" "b" {
  bucket = "182f4d0atfstate"

  tags = {
    Name        = "Terraform State Assignment"
    Environment = "182F4D0A"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}
