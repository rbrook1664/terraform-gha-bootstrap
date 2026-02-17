terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.28"
    }
  }

  backend "s3" {
    bucket       = ""
    key          = "terraform/terraform.tfstate"
    region       = "eu-west-2"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region = "eu-west-2"

  default_tags {
    tags = {
      Supplier  = ""
      ManagedBy = "Terraform"
      #StateBucket = var.bucket
      #StatePrefix = var.key
    }
  }

  ignore_tags {
    keys = ["Creator"]
  }
}