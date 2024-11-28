output "rds_customer" {
  description = "RDS Customer URL"
  value       = aws_db_instance.rds-customer.endpoint
}

output "rds_product" {
  description = "RDS Product URL"
  value       = aws_db_instance.rds-product.endpoint
}