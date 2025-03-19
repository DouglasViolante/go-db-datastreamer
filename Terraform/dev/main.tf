terraform {
  required_version = ">= 1.3.0"
  
  # backend "s3" {
  #   bucket         = "my-terraform-state-bucket"
  #   key            = "dev/terraform.tfstate"
  #   region         = "us-east-1"
  #   dynamodb_table = "my-terraform-lock"
  # }
}

provider "aws" {
  region = var.aws_region
}

module "kinesis" {
  source            = "../modules/kinesis"
  stream_name       = var.kinesis_stream_name
  shard_count       = var.kinesis_shard_count
  retention_hours   = var.kinesis_retention_hours
}

module "lambda" {
  source              = "../modules/lambda"
  kinesis_stream_arn  = module.kinesis.stream_arn
  dynamodb_table_arn  = module.dynamodb.table_arn
  dynamodb_table_name = var.dynamodb_table_name
}

module "dynamodb" {
  source              = "../modules/dynamodb"
  dynamodb_table_name = var.dynamodb_table_name
  hash_key            = "id"
  hash_key_type       = "S" 
  range_key           = "game_id"
  range_key_type      = "S"
}

# output "kinesis_stream_arn" {
#   value = module.kinesis.stream_arn
# }

# output "dynamodb_table_arn" {
#   value = module.dynamodb.table_arn
# }
