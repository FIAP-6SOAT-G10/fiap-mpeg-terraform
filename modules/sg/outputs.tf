output "rds_customer_security_group_id" {
  value = aws_security_group.rds_customer_security_group.id
}

output "rds_product_security_group_id" {
  value = aws_security_group.rds_product_security_group.id
}

output "elastic_cache_product_category_security_group_id" {
  value = aws_security_group.elastic_cache_product_category_security_group.id
}

output "redshift_security_group_id" {
  value = aws_security_group.redshift_security_group.id
}