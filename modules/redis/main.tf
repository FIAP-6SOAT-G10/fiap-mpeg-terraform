resource "aws_elasticache_replication_group" "redis_product_category" {
  description                   = "Redis Product Category"
  replication_group_id          = "redis-product-category"
  node_type                     = "cache.t3.micro"
  subnet_group_name             = var.elastic_cache_subnet_group_name
  security_group_ids            = [var.elastic_cache_product_category_security_group_id]
  engine                        = "redis"
  engine_version                = "6.x"
  maintenance_window            = "sun:05:00-sun:09:00"
  port                          = 6379
}