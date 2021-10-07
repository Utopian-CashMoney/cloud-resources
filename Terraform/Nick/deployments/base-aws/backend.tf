terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.34"
    }
  }
  required_version = ">= 0.14.0"
}

provider "aws" {
  region = var.aws_region
}
