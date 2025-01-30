resource "aws_route_table_association" "route_table_association_eks_pub_1" {
  subnet_id      = var.eks_public_subnets_ids[0]
  route_table_id = var.eks_route_table_id
}

resource "aws_route_table_association" "route_table_association_eks_pub_2" {
  subnet_id      = var.eks_public_subnets_ids[1]
  route_table_id = var.eks_route_table_id
}

resource "aws_route_table_association" "route_table_association_eks_pvt_1" {
  subnet_id      = var.eks_private_subnets_ids[0]
  route_table_id = var.eks_route_table_id
}

resource "aws_route_table_association" "route_table_association_eks_pvt_2" {
  subnet_id      = var.eks_private_subnets_ids[1]
  route_table_id = var.eks_route_table_id
}