terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region                    = "us-east-1"
  shared_credentials_files  = ["%USERPROFILE%/.aws/credentials"]
  profile                   = "default"

  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3       = "http://s3.localhost.localstack.cloud:4566"
    dynamodb = "http://localhost:4566"
    lambda   = "http://localhost:4566"
    kinesis  = "http://localhost:4566"
    sts      = "http://localhost:4566"
  }
}