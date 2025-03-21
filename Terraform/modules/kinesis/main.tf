resource "aws_kinesis_stream" "this" {
  name             = var.stream_name
  shard_count      = var.shard_count
  retention_period = var.retention_hours

  tags = {
    Environment = "dev"
    Name        = var.stream_name
  }
}