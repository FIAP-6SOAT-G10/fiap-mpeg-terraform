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