resource "aws_internet_gateway" "eks_internet_gateway" {
  vpc_id      = var.eks_vpc_id

  tags        = {
    Name      = "Public EKS Internet Gateway"
  }
}

resource "aws_internet_gateway" "redshift_internet_gateway" {
  vpc_id      = var.redshift_vpc_id

  tags        = {
    Name      = "Public Redshift Internet Gateway"
  }
}

resource "aws_internet_gateway" "redis_internet_gateway" {
  vpc_id      = var.elastic_cache_vpc_id

  tags = {
    Name      = "Public Redis Internet Gateway"
  }
}

resource "aws_internet_gateway" "rds_internet_gateway" {
  vpc_id      = var.rds_vpc_id

  tags = {
    Name      = "Public RDS Internet Gateway"
  }
}