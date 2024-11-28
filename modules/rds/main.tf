resource "aws_db_instance" "rds-customer" {
  identifier             = "db-customer"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = 14.9
  username               = "tech"
  password               = "tech_passwd"
  db_subnet_group_name   = var.rds_customer_subnet_group_name
  vpc_security_group_ids = [var.rds_customer_security_group_id]
  parameter_group_name   = var.rds_customer_parameter_group_name
  publicly_accessible    = true
  skip_final_snapshot    = true
}

resource "aws_db_instance" "rds-product" {
  identifier             = "db-product"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = 14.9
  username               = "tech"
  password               = "tech_passwd"
  db_subnet_group_name   = var.rds_product_subnet_group_name
  vpc_security_group_ids = [var.rds_product_security_group_id]
  parameter_group_name   = var.rds_product_parameter_group_name
  publicly_accessible    = true
  skip_final_snapshot    = true
}