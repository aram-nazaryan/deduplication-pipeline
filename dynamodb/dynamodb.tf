variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table"
  type        = string
}

resource "aws_dynamodb_table" "deduplication_table" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "event_id"
    type = "S"
  }

  # Define the partition key (primary key)
  hash_key = "event_id"

  stream_enabled   = true
  stream_view_type = "NEW_IMAGE"

  ttl {
    attribute_name = "ttl"
    enabled        = true
  }
}

output "dynamodb_stream_arn" {
  value = aws_dynamodb_table.deduplication_table.stream_arn
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.deduplication_table.name
}
