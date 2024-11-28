resource "aws_subnet" "eks_cluster_subnet_pub_1" {
  vpc_id                                        = var.eks_vpc_id
  cidr_block                                    = "192.168.0.0/27"
  availability_zone                             = var.aws_availability_zone_us_east_1a_name
#   depends_on                                    = [aws_internet_gateway.eks_internet_gateway]
  map_public_ip_on_launch                       = true
  tags = {
    Name                                        = "EKS Cluster Subnet Public 1",
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/fiap_fast_food_eks"  = "shared"
  }
}

resource "aws_subnet" "eks_cluster_subnet_pub_2" {
  vpc_id                                        = var.eks_vpc_id
  cidr_block                                    = "192.168.0.32/27"
  availability_zone                             = var.aws_availability_zone_us_east_1b_name
  map_public_ip_on_launch                       = true
  tags = {
    Name                                        = "EKS Cluster Subnet Public 2",
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/fiap_fast_food_eks"  = "shared"
  }
}

resource "aws_subnet" "eks_cluster_subnet_pvt_1" {
  vpc_id                                        = var.eks_vpc_id
  cidr_block                                    = "192.168.0.64/27"
  availability_zone                             = var.aws_availability_zone_us_east_1a_name
  map_public_ip_on_launch                       = true
  tags                                          = {
    Name                                        = "EKS Cluster Subnet Private 1",
    "kubernetes.io/cluster/fiap_fast_food_eks"  = "shared"
  }
}

resource "aws_subnet" "eks_cluster_subnet_pvt_2" {
  vpc_id                                        = var.eks_vpc_id
  cidr_block                                    = "192.168.0.96/27"
  availability_zone                             = var.aws_availability_zone_us_east_1b_name
  map_public_ip_on_launch                       = true
  tags                                          = {
    Name                                        = "EKS Cluster Subnet Private 2",
    "kubernetes.io/cluster/fiap_fast_food_eks"  = "shared"
  }
}

resource "aws_subnet" "redshift_cluster_subnet_pub_1" {
  vpc_id                                        = var.redshift_vpc_id
  cidr_block                                    = "172.0.64.0/18"
  availability_zone                             = var.aws_availability_zone_us_east_1a_name
#   depends_on                                    = [aws_vpc.redshift_vpc]
  map_public_ip_on_launch                       = true
  tags = {
    Name                                        = "Redshift Cluster Subnet Pub 1"
  }
}

resource "aws_subnet" "redshift_cluster_subnet_pub_2" {
  vpc_id                                        = var.redshift_vpc_id
  cidr_block                                    = "172.0.128.0/18"
  availability_zone                             = var.aws_availability_zone_us_east_1a_name
#   depends_on                                    = [aws_vpc.redshift_vpc]
  map_public_ip_on_launch                       = true
  tags                                          = {
    Name                                        = "Redshift Cluster Subnet Pub 2"
  }
}

resource "aws_redshift_subnet_group" "redshift_subnet_group" {
  name                                          = "redshift-subnet-group"
  subnet_ids                                    = [
    aws_subnet.redshift_cluster_subnet_pub_1.id,
    aws_subnet.redshift_cluster_subnet_pub_2.id,
  ]
  tags                                          = {
    Name                                        = "Redshift Subnet Group"
  }
}

resource "aws_subnet" "elastic_cache_subnet_pvt_1" {
  vpc_id                                        = var.elastic_cache_vpc_id
  cidr_block                                    = "172.168.0.0/18"
  availability_zone                             = var.aws_availability_zone_us_east_1b_name
#   depends_on                                    = [aws_vpc.elastic_cache_vpc]
  tags = {
    Name                                        = "Elastic Cache Subnet Private 1"
  }
}

resource "aws_elasticache_subnet_group" "elastic_cache_subnet_group" {
  name                                          = "elastic-cache-subnet-group"
  subnet_ids                                    = [aws_subnet.elastic_cache_subnet_pvt_1.id]
  tags                                          = {
    Name                                        = "Elastic Cache Subnet Group"
  }
}

resource "aws_subnet" "rds_customer_subnet_pub_1" {
  vpc_id                                        = var.rds_vpc_id
  cidr_block                                    = "10.0.0.0/24"
  availability_zone                             = var.aws_availability_zone_us_east_1a_name
  map_public_ip_on_launch                       = true
#   depends_on                                    = [aws_vpc.rds_vpc]
  tags = {
    Name                                        = "RDS Customer Subnet Public 1"
  }
}

resource "aws_subnet" "rds_customer_subnet_pub_2" {
  vpc_id                                        = var.rds_vpc_id
  cidr_block                                    = "10.0.1.0/24"
  availability_zone                             = var.aws_availability_zone_us_east_1b_name
  map_public_ip_on_launch                       = true
#   depends_on                                    = [aws_vpc.rds_vpc]
  tags = {
    Name                                        = "RDS Customer Subnet Public 2"
  }
}

resource "aws_db_subnet_group" "rds_customer_subnet_group" {
  name                                          = "rds-customer-subnet-group"
  subnet_ids                                    = [
    aws_subnet.rds_customer_subnet_pub_1.id,
    aws_subnet.rds_customer_subnet_pub_2.id
  ]

  tags                                          = {
    Name                                        = "RDS Customer Subnet Group"
  }
}

resource "aws_subnet" "rds_product_subnet_pub_1" {
  vpc_id                                        = var.rds_vpc_id
  cidr_block                                    = "10.0.3.0/24"
  availability_zone                             = var.aws_availability_zone_us_east_1a_name
  map_public_ip_on_launch                       = true
#   depends_on                                    = [aws_vpc.rds_vpc]
  tags = {
    Name                                        = "RDS Product Subnet Public 1"
  }
}

resource "aws_subnet" "rds_product_subnet_pub_2" {
  vpc_id                                        = var.rds_vpc_id
  cidr_block                                    = "10.0.4.0/24"
  availability_zone                             = var.aws_availability_zone_us_east_1b_name
  map_public_ip_on_launch                       = true
#   depends_on                                    = [aws_vpc.rds_vpc]
  tags = {
    Name                                        = "RDS Product Subnet Public 2"
  }
}

resource "aws_db_subnet_group" "rds_product_subnet_group" {
  name                                          = "rds-product-subnet-group"
  subnet_ids                                    = [
    aws_subnet.rds_product_subnet_pub_1.id,
    aws_subnet.rds_product_subnet_pub_2.id
  ]

  tags                                          = {
    Name                                        = "RDS Product Subnet Group"
  }
}