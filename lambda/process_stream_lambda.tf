resource "aws_lambda_function" "process_stream" {
  function_name = "process_stream_lambda"
  runtime       = "python3.9"
  handler       = "process_stream.lambda_handler"
  role          = var.lambda_execution_role_arn

  environment {
    variables = {
      LOGGING_LEVEL = "INFO"
    }
  }

  s3_bucket = "cloud-bucket-aram"
  s3_key    = "lambda/process_stream.zip"
}
