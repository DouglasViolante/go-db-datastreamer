variable "stream_name" {
  description = "Name of the Kinesis stream"
  type        = string
}

variable "shard_count" {
  description = "Number of shards in the Kinesis stream"
  type        = number
}

variable "retention_hours" {
  description = "Retention period for Kinesis stream (in hours)"
  type        = number
}