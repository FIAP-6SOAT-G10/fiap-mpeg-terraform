resource "aws_internet_gateway" "eks_internet_gateway" {
  vpc_id      = var.eks_vpc_id

  tags        = {
    Name      = "Public EKS Internet Gateway"
  }
}