resource "aws_route_table" "eks_route_table" {
  vpc_id                = var.eks_vpc_id
  route {
    cidr_block          = "0.0.0.0/0"
    gateway_id          = var.eks_internet_gateway_id
  }
  tags                  = {
    Name                = "EKS Route Table"
  }
}

resource "aws_route_table" "redshift_route_table" {
  vpc_id                = var.redshift_vpc_id
  route {
    cidr_block          = "0.0.0.0/0"
    gateway_id          = var.redshift_internet_gateway_id
  }
  tags                  = {
    Name                = "Redshift Route Table"
  }
}

resource "aws_route_table" "rds_route_table" {
  vpc_id                = var.rds_vpc_id
  route {
    cidr_block          = "0.0.0.0/0"
    gateway_id          = var.rds_internet_gateway_id
  }
  tags                  = {
    Name                = "RDS Route Table"
  }
}