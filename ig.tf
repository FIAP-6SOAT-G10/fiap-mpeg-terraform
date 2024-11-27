resource "aws_internet_gateway" "eks_internet_gateway" {
  vpc_id      = aws_vpc.eks_vpc.id

  tags        = {
    Name      = "Public EKS Internet Gateway"
  }
}

resource "aws_internet_gateway" "redshift_internet_gateway" {
  vpc_id      = aws_vpc.redshift_vpc.id

  tags        = {
    Name      = "Public Redshift Internet Gateway"
  }

  depends_on  = [
    aws_vpc.redshift_vpc
  ]
}

resource "aws_internet_gateway" "redis_internet_gateway" {
  vpc_id      = aws_vpc.elastic_cache_vpc.id

  tags = {
    Name      = "Public Redis Internet Gateway"
  }
}

resource "aws_internet_gateway" "rds_internet_gateway" {
  vpc_id      = aws_vpc.rds_vpc.id

  tags = {
    Name      = "Public RDS Internet Gateway"
  }
}