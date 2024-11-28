output "order_payment_updates_queue_arn" {
  value = aws_sqs_queue.order_payment_updates_queue.arn
}

output "production_payment_updates_queue_arn" {
  value = aws_sqs_queue.production_payment_updates_queue.arn
}