output "eks-endpoint" {
    description = "AWS EKS Endpoint "
    value       = aws_eks_cluster.fiap_fast_food_eks.endpoint
}

output "redis_endpoint" {
    description = "Redis Endpoint"
    value       = aws_elasticache_replication_group.redis_product_category.primary_endpoint_address
}

output "rds_customer" {
    description = "RDS Customer URL"
    value       = aws_db_instance.rds-customer.endpoint
}

output "rds_product" {
    description = "RDS Product URL"
    value       = aws_db_instance.rds-product.endpoint
}

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