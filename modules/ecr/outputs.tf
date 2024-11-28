output "ecr_payments" {
  description = "ECR Payments"
  value       = aws_ecr_repository.payments.repository_url
}

output "ecr_products" {
  description = "ECR Products"
  value       = aws_ecr_repository.products.repository_url
}

output "ecr_productions" {
  description = "ECR Productions"
  value       = aws_ecr_repository.productions.repository_url
}

output "ecr_orders" {
  description = "ECR Orders"
  value       = aws_ecr_repository.orders.repository_url
}

output "ecr_customers" {
  description = "ECR Customers"
  value       = aws_ecr_repository.customers.repository_url
}