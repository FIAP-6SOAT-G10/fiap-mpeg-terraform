output "redis_endpoint" {
  description = "Redis Endpoint"
  value       = aws_elasticache_replication_group.redis_product_category.primary_endpoint_address
}