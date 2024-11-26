resource "aws_vpc" "eks_vpc" {
  cidr_block            = "192.168.0.0/24"

  tags                  = {
    Name                = "EKS Public VPC"
  }

  enable_dns_support    = true
  enable_dns_hostnames  = true
}

resource "aws_vpc" "redshift_vpc" {
  cidr_block            = "172.0.0.0/16"

  instance_tenancy      = "default"

  tags                  = {
    Name                = "Redshift Public VPC"
  }
}

resource "aws_vpc" "elastic_cache_vpc" {
  cidr_block            = "172.168.0.0/16"

  instance_tenancy      = "default"

  tags                  = {
    Name                = "ElasticCache Public VPC"
  }
}

resource "aws_vpc" "rds_customer_vpc" {
  cidr_block            = "10.0.0.0/16"

  instance_tenancy      = "default"

  tags                  = {
    Name                = "RDS Customer Public VPC"
  }
}

resource "aws_vpc" "rds_product_vpc" {
  cidr_block            = "12.0.0.0/16"

  instance_tenancy      = "default"

  tags                  = {
    Name                = "RDS Product Public VPC"
  }
}

resource "aws_route_table" "eks_route_table" {
  vpc_id                = aws_vpc.eks_vpc.id
  route {
    cidr_block          = "0.0.0.0/0"
    gateway_id          = aws_internet_gateway.eks_internet_gateway.id
  }
  tags                  = {
    Name                = "EKS Route Table"
  }
}

resource "aws_route_table" "redshift_route_table" {
  vpc_id                = aws_vpc.redshift_vpc.id
  route {
    cidr_block          = "0.0.0.0/0"
    gateway_id          = aws_internet_gateway.redshift_internet_gateway.id
  }
  tags                  = {
    Name                = "Redshift Route Table"
  }
}

resource "aws_route_table_association" "route_table_association_eks_pub_1" {
  subnet_id      = aws_subnet.eks_cluster_subnet_pub_1.id
  route_table_id = aws_route_table.eks_route_table.id
}

resource "aws_route_table_association" "route_table_association_eks_pub_2" {
  subnet_id      = aws_subnet.eks_cluster_subnet_pub_2.id
  route_table_id = aws_route_table.eks_route_table.id
}

resource "aws_route_table_association" "route_table_association_eks_pvt_1" {
  subnet_id      = aws_subnet.eks_cluster_subnet_pvt_1.id
  route_table_id = aws_route_table.eks_route_table.id
}

resource "aws_route_table_association" "route_table_association_eks_pvt_2" {
  subnet_id      = aws_subnet.eks_cluster_subnet_pvt_2.id
  route_table_id = aws_route_table.eks_route_table.id
}

resource "aws_route_table_association" "route_table_association_redshift_pub_1" {
  subnet_id      = aws_subnet.redshift_cluster_subnet_pub_1.id
  route_table_id = aws_route_table.redshift_route_table.id
}

resource "aws_route_table_association" "route_table_association_redshift_pub_2" {
  subnet_id      = aws_subnet.redshift_cluster_subnet_pub_2.id
  route_table_id = aws_route_table.redshift_route_table.id
}

resource "aws_vpc_endpoint_security_group_association" "sg_ec2" {
  vpc_endpoint_id   = aws_vpc_endpoint.ec2.id
  security_group_id = aws_eks_cluster.fiap_fast_food_eks.vpc_config[0].cluster_security_group_id
}

resource "aws_vpc_endpoint" "ec2" {
  vpc_id            = aws_vpc.eks_vpc.id
  service_name      = "com.amazonaws.us-east-1.ec2"
  vpc_endpoint_type = "Interface"
}

resource "aws_vpc_endpoint_security_group_association" "sg_ecr_api" {
  vpc_endpoint_id   = aws_vpc_endpoint.ecr_api.id
  security_group_id = aws_eks_cluster.fiap_fast_food_eks.vpc_config[0].cluster_security_group_id
}

resource "aws_vpc_endpoint" "ecr_api" {
  vpc_id            = aws_vpc.eks_vpc.id
  service_name      = "com.amazonaws.us-east-1.ecr.api"
  vpc_endpoint_type = "Interface"
}

resource "aws_vpc_endpoint_security_group_association" "sg_ecr_dkr" {
  vpc_endpoint_id   = aws_vpc_endpoint.ecr_dkr.id
  security_group_id = aws_eks_cluster.fiap_fast_food_eks.vpc_config[0].cluster_security_group_id
}

resource "aws_vpc_endpoint" "ecr_dkr" {
  vpc_id            = aws_vpc.eks_vpc.id
  service_name      = "com.amazonaws.us-east-1.ecr.dkr"
  vpc_endpoint_type = "Interface"
}

resource "aws_vpc_endpoint_security_group_association" "sg_sts" {
  vpc_endpoint_id   = aws_vpc_endpoint.sts.id
  security_group_id = aws_eks_cluster.fiap_fast_food_eks.vpc_config[0].cluster_security_group_id
}

resource "aws_vpc_endpoint" "sts" {
  vpc_id            = aws_vpc.eks_vpc.id
  service_name      = "com.amazonaws.us-east-1.sts"
  vpc_endpoint_type = "Interface"
}