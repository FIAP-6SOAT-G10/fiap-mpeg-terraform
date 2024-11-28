output "rds_customer_parameter_group_name" {
  value = aws_db_parameter_group.rds_customer_parameter_group.name
}

output "rds_product_parameter_group_name" {
  value = aws_db_parameter_group.rds_product_parameter_group.name
}