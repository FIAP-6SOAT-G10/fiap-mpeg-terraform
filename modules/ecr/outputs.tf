output "ecr_payments" {
  description = "ECR Uploader"
  value       = aws_ecr_repository.fiap_mpeg_uploader.repository_url
}

output "ecr_products" {
  description = "ECR Notificator"
  value       = aws_ecr_repository.fiap_mpeg_notificator.repository_url
}

output "ecr_productions" {
  description = "ECR Processor"
  value       = aws_ecr_repository.fiap_mpeg_processor.repository_url
}