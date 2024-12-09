output "sqs_queue_url" {
  value = module.sqs.sqs_queue_url
}

output "dynamodb_table_name" {
  value = module.dynamodb.dynamodb_table_name
}
