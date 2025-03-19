resource "aws_iam_role" "lambda_role" {
  name = "kinesis_lambda_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_policy" "lambda_kinesis_dynamodb" {
  name        = "lambda_kinesis_dynamodb_policy"
  description = "Allows Lambda to read from Kinesis and write to DynamoDB"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "kinesis:GetRecords",
          "kinesis:GetShardIterator",
          "kinesis:DescribeStream",
          "kinesis:ListStreams"
        ]
        Effect   = "Allow"
        Resource = var.kinesis_stream_arn
      },
      {
        Action = [
          "dynamodb:PutItem"
        ]
        Effect   = "Allow"
        Resource = var.dynamodb_table_arn
      },
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "lambda_policy_attachment" {
  name       = "lambda_kinesis_dynamodb_attachment"
  roles      = [aws_iam_role.lambda_role.name]
  policy_arn = aws_iam_policy.lambda_kinesis_dynamodb.arn
}

resource "aws_lambda_function" "kinesis_processor" {
  function_name = "unload_kinesis_to_dynamodb"
  runtime       = "python3.9"
  handler       = "lambda_function.lambda_handler"
  role          = aws_iam_role.lambda_role.arn

  filename         = "lambda.zip"
  source_code_hash = filebase64sha256("lambda.zip")

  environment {
    variables = {
      DYNAMODB_TABLE_NAME = var.dynamodb_table_name
    }
  }
}

resource "aws_lambda_event_source_mapping" "kinesis_trigger" {
  event_source_arn = var.kinesis_stream_arn
  function_name    = aws_lambda_function.kinesis_processor.arn
  starting_position = "LATEST"
  batch_size       = 100
}