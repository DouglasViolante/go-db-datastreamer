output "kinesis_stream_arn" {
  description = "ARN of the Kinesis stream"
  value       = module.kinesis.stream_arn
}

output "dynamodb_table_arn" {
  description = "ARN of the DynamoDB table"
  value       = module.dynamodb.table_arn
}

output "dynamodb_table_name" {
  description = "Name of the DynamoDB table"
  value       = module.dynamodb.table_name
}