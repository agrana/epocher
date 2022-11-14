terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "182f4d0atfstate"
    region = "eu-west-1"
    # Key passed at init.
    # key    = "cs-test-multihost-1"
  }
}

provider "aws" {
  region = "us-east-2"
  # assume_role {
    # role_arn = "some_role"
  # }
}

data "aws_caller_identity" "current" {}

module epocher_app {
  source = "./modules/epocher_app"
  account_id = data.aws_caller_identity.current.account_id
  region = "us-east-2"
  application_name = var.application_name
  environment = var.environment
}
