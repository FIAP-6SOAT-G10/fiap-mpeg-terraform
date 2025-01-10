resource "aws_vpc" "eks_vpc" {
  cidr_block            = "192.168.0.0/16"

  tags                  = {
    Name                = "EKS Public VPC"
  }

  enable_dns_support    = true
  enable_dns_hostnames  = true
}

resource "aws_vpc_endpoint" "ec2" {
  vpc_id            = aws_vpc.eks_vpc.id
  service_name      = "com.amazonaws.us-east-1.ec2"
  vpc_endpoint_type = "Interface"
}

resource "aws_vpc_endpoint" "ecr_api" {
  vpc_id            = aws_vpc.eks_vpc.id
  service_name      = "com.amazonaws.us-east-1.ecr.api"
  vpc_endpoint_type = "Interface"
}

resource "aws_vpc_endpoint" "ecr_dkr" {
  vpc_id            = aws_vpc.eks_vpc.id
  service_name      = "com.amazonaws.us-east-1.ecr.dkr"
  vpc_endpoint_type = "Interface"
}

resource "aws_vpc_endpoint" "sts" {
  vpc_id            = aws_vpc.eks_vpc.id
  service_name      = "com.amazonaws.us-east-1.sts"
  vpc_endpoint_type = "Interface"
}