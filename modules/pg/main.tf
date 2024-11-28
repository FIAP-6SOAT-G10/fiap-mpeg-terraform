resource "aws_db_parameter_group" "rds_customer_parameter_group" {
  name   = "rds-customer-parameter-group"
  family = "postgres14"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}

resource "aws_db_parameter_group" "rds_product_parameter_group" {
  name   = "rds-product-parameter-group"
  family = "postgres14"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}