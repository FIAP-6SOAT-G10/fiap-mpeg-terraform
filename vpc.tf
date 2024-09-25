resource "aws_vpc" "primary" {
  cidr_block = "192.168.0.0/16"

  tags = {
    Name = "Public VPC"
  }

  enable_dns_support = true
  enable_dns_hostnames = true
}

resource "aws_security_group" "sg_fiap_fast_food" {
  name        = "fiapfastfood"
  description = "Security group to instance access"
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

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Permite todo o tráfego de entrada
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Permite todo o tráfego de saída
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_vpc_endpoint_security_group_association" "sg_s3" {
  vpc_endpoint_id   = aws_vpc_endpoint.s3.id
  security_group_id = aws_security_group.sg_fiap_fast_food.id
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id            = aws_vpc.primary.id
  service_name      = "com.amazonaws.us-east-1.s3"
  vpc_endpoint_type = "Interface"
}

resource "aws_vpc_endpoint_security_group_association" "sg_ec2" {
  vpc_endpoint_id   = aws_vpc_endpoint.ec2.id
  security_group_id = aws_security_group.sg_fiap_fast_food.id
}

resource "aws_vpc_endpoint" "ec2" {
  vpc_id            = aws_vpc.primary.id
  service_name      = "com.amazonaws.us-east-1.ec2"
  vpc_endpoint_type = "Interface"
}

resource "aws_vpc_endpoint_security_group_association" "sg_ecr_api" {
  vpc_endpoint_id   = aws_vpc_endpoint.ecr_api.id
  security_group_id = aws_security_group.sg_fiap_fast_food.id
}

resource "aws_vpc_endpoint" "ecr_api" {
  vpc_id            = aws_vpc.primary.id
  service_name      = "com.amazonaws.us-east-1.ecr.api"
  vpc_endpoint_type = "Interface"
}

resource "aws_vpc_endpoint_security_group_association" "sg_ecr_dkr" {
  vpc_endpoint_id   = aws_vpc_endpoint.ecr_dkr.id
  security_group_id = aws_security_group.sg_fiap_fast_food.id
}

resource "aws_vpc_endpoint" "ecr_dkr" {
  vpc_id            = aws_vpc.primary.id
  service_name      = "com.amazonaws.us-east-1.ecr.dkr"
  vpc_endpoint_type = "Interface"
}

resource "aws_vpc_endpoint_security_group_association" "sg_sts" {
  vpc_endpoint_id   = aws_vpc_endpoint.sts.id
  security_group_id = aws_security_group.sg_fiap_fast_food.id
}

resource "aws_vpc_endpoint" "sts" {
  vpc_id            = aws_vpc.primary.id
  service_name      = "com.amazonaws.us-east-1.sts"
  vpc_endpoint_type = "Interface"
}