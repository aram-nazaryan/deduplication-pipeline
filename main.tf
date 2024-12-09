provider "aws" {
  region = "us-east-1"
}

module "sqs" {
  source          = "./sqs"
  sqs_queue_name  = var.sqs_queue_name
}
module "dynamodb" {
  source              = "./dynamodb"
  dynamodb_table_name = var.dynamodb_table_name
}

module "lambda" {
  source                  = "./lambda"
  dynamodb_table_name     = var.dynamodb_table_name
  lambda_execution_role_arn = var.lambda_execution_role_arn
}
