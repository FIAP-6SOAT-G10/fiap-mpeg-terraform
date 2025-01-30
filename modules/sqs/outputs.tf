output "request_video_notificator_queue_arn" {
  value = aws_sqs_queue.sqs_request_video_notificator.arn
}

output "request_video_processor_queue_arn" {
  value = aws_sqs_queue.sqs_request_video_processor.arn
}