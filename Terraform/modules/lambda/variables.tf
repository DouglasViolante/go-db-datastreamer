variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "unload_kinesis_to_dynamodb"
}

variable "kinesis_stream_arn" {
  description = "ARN of the Kinesis stream"
  type        = string
}

variable "dynamodb_table_arn" {
  description = "ARN of the DynamoDB table"
  type        = string
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table"
  type        = string
}

