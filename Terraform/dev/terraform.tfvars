aws_region = "us-east-1"

kinesis_stream_name    = "dev-player-rankings-stream"
kinesis_shard_count    = 2
kinesis_retention_hours = 24

dynamodb_table_name   = "dev-player-rankings-table"
dynamodb_read_capacity  = 5
dynamodb_write_capacity = 5