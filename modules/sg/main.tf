resource "aws_security_group" "redshift_security_group" {
  vpc_id        = var.redshift_vpc_id
  ingress {
    from_port   = 5439
    to_port     = 5439
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags          = {
    Name        = "Redshift Security Group"
  }

#   depends_on    = [
#     aws_vpc.redshift_vpc
#   ]
}

resource "aws_security_group" "elastic_cache_product_category_security_group" {
  name          = "elastic_cache-security-group"
  description   = "Security Group Elastic Cache-Redis"
  vpc_id        = var.elastic_cache_vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags          = {
    Name        = "ElasticCache Product Category Security Group"
  }

#   depends_on    = [
#     aws_vpc.elastic_cache_vpc
#   ]
}

resource "aws_security_group" "rds_customer_security_group" {
  name          = "rds-customer-security-group"
  vpc_id        = var.rds_vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags          = {
    Name        = "RDS Customer Security Group"
  }
}

resource "aws_security_group" "rds_product_security_group" {
  name          = "rds-product-security-group"
  vpc_id        = var.rds_vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags          = {
    Name        = "RDS Product Security Group"
  }
}