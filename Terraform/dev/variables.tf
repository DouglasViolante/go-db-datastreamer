variable "aws_region" {
  description = "AWS region for the infrastructure"
  type        = string
}

variable "kinesis_stream_name" {
  description = "Kinesis Stream for Player Rank Info"
  type        = string
}

variable "kinesis_shard_count" {
  description = "Number of shards for the Kinesis stream"
  type        = number
}

variable "kinesis_retention_hours" {
  description = "Data retention period for Kinesis (in hours)"
  type        = number
}

variable "dynamodb_table_name" {
  description = "Table to Store Player Rankings"
  type        = string
}

variable "dynamodb_read_capacity" {
  description = "Read capacity units for the DynamoDB table"
  type        = number
}

variable "dynamodb_write_capacity" {
  description = "Write capacity units for the DynamoDB table"
  type        = number
}
