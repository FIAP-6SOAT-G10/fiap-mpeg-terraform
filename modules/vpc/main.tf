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

resource "aws_vpc" "rds_vpc" {
  cidr_block            = "10.0.0.0/16"

  instance_tenancy      = "default"
  enable_dns_hostnames  = true
  enable_dns_support    = true

  tags                  = {
    Name                = "RDS Public VPC"
  }
}

# resource "aws_vpc_endpoint_security_group_association" "sg_ec2" {
#   vpc_endpoint_id   = aws_vpc_endpoint.ec2.id
#   security_group_id = var.cluster_security_group_id
# }

resource "aws_vpc_endpoint" "ec2" {
  vpc_id            = aws_vpc.eks_vpc.id
  service_name      = "com.amazonaws.us-east-1.ec2"
  vpc_endpoint_type = "Interface"
}

# resource "aws_vpc_endpoint_security_group_association" "sg_ecr_api" {
#   vpc_endpoint_id   = aws_vpc_endpoint.ecr_api.id
#   security_group_id = var.cluster_security_group_id
# }

resource "aws_vpc_endpoint" "ecr_api" {
  vpc_id            = aws_vpc.eks_vpc.id
  service_name      = "com.amazonaws.us-east-1.ecr.api"
  vpc_endpoint_type = "Interface"
}

# resource "aws_vpc_endpoint_security_group_association" "sg_ecr_dkr" {
#   vpc_endpoint_id   = aws_vpc_endpoint.ecr_dkr.id
#   security_group_id = var.cluster_security_group_id
# }

resource "aws_vpc_endpoint" "ecr_dkr" {
  vpc_id            = aws_vpc.eks_vpc.id
  service_name      = "com.amazonaws.us-east-1.ecr.dkr"
  vpc_endpoint_type = "Interface"
}

# resource "aws_vpc_endpoint_security_group_association" "sg_sts" {
#   vpc_endpoint_id   = aws_vpc_endpoint.sts.id
#   security_group_id = var.cluster_security_group_id
# }

resource "aws_vpc_endpoint" "sts" {
  vpc_id            = aws_vpc.eks_vpc.id
  service_name      = "com.amazonaws.us-east-1.sts"
  vpc_endpoint_type = "Interface"
}