resource "aws_lambda_function" "process_sqs" {
  function_name = "process_sqs_lambda"
  runtime       = "python3.9"
  handler       = "process_sqs.lambda_handler"
  role          = var.lambda_execution_role_arn

  environment {
    variables = {
      DYNAMODB_TABLE = var.dynamodb_table_name
    }
  }

  s3_bucket = "cloud-bucket-aram"
  s3_key    = "lambda/process_sqs.zip"
}
