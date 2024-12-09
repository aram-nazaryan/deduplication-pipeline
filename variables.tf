variable "sqs_queue_name" {
  description = "The name of the SQS queue"
  default     = "deduplication-queue"
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table"
  type        = string
}

variable "lambda_execution_role_arn" {
  description = "IAM role ARN for Lambda execution"
  type        = string
}
