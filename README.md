# go-db-datastreamer

Small project the Streams Data that sends data to AWS Kinesis and move to AWS DynamoDB with a Lambda Function.

## Third Party Libs and Tools

- [AWS SDK v2](https://aws.github.io/aws-sdk-go-v2/docs/)
- [GoFakeIt](https://github.com/brianvoe/gofakeit)
- [Localstack](https://docs.localstack.cloud)

## How to Run

- Requires Docker!

- Run the command ```docker-compose up --force-recreate --build``` in the same folder level as the file ```docker-compose.yml```

## Useful AWS CLI Commands

awslocal kinesis create-stream --stream-name dev-player-rankings-stream --shard-count 1

awslocal kinesis describe-stream --stream-name dev-player-rankings-stream

awslocal s3api create-bucket --bucket my-terraform-state-bucket --region us-east-1

awslocal s3api list-buckets --region us-east-1

awslocal s3 ls

awslocal dynamodb create-table --table-name my-terraform-lock --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --billing-mode PAY_PER_REQUEST

awslocal dynamodb list-tables --region us-east-1

aws --endpoint-url=http://localhost:4566 sts get-caller-identity --region us-east-1 --profile default


