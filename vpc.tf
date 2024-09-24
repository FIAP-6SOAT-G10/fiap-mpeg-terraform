resource "aws_vpc" "primary" {
  cidr_block = "192.168.0.0/16"

  tags = {
    Name = "Private VPC"
  }

  enable_dns_support = true
  enable_dns_hostnames = true
}

resource "aws_vpc" "secondary" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Public VPC"
  }
}

resource "aws_security_group" "security_group_fiap_fast_food" {
  name        = "fiap-fast-food"
  description = "Security group para acesso a instâncias"
  vpc_id      = aws_vpc.primary.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Permite acesso SSH de qualquer IP
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Permite acesso HTTP de qualquer IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Permite todo o tráfego de saída
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id            = aws_vpc.primary.id
  service_name      = "com.amazonaws.us-east-1.s3"
  vpc_endpoint_type = "Interface"
}

resource "aws_vpc_endpoint" "ec2" {
  vpc_id            = aws_vpc.primary.id
  service_name      = "com.amazonaws.us-east-1.ec2"
  vpc_endpoint_type = "Interface"
}

resource "aws_vpc_endpoint" "ecr_api" {
  vpc_id            = aws_vpc.primary.id
  service_name      = "com.amazonaws.us-east-1.ecr.api"
  vpc_endpoint_type = "Interface"
}

resource "aws_vpc_endpoint" "ecr_dkr" {
  vpc_id            = aws_vpc.primary.id
  service_name      = "com.amazonaws.us-east-1.ecr.dkr"
  vpc_endpoint_type = "Interface"
}

resource "aws_vpc_endpoint" "sts" {
  vpc_id            = aws_vpc.primary.id
  service_name      = "com.amazonaws.us-east-1.sts"
  vpc_endpoint_type = "Interface"
}