resource "aws_sqs_queue" "deduplication_queue" {
  name = var.sqs_queue_name
}
variable "sqs_queue_name" {
  description = "The name of the SQS queue"
  type        = string
}
output "sqs_queue_arn" {
  value = aws_sqs_queue.deduplication_queue.arn
}
output "sqs_queue_url" {
  value = aws_sqs_queue.deduplication_queue.id
}