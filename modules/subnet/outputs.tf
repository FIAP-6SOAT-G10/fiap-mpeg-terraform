output "eks_private_subnet_ids" {
  value = [
    aws_subnet.eks_cluster_subnet_pvt_1.id,
    aws_subnet.eks_cluster_subnet_pvt_2.id
  ]
}

output "eks_public_subnet_ids" {
  value = [
    aws_subnet.eks_cluster_subnet_pub_1.id,
    aws_subnet.eks_cluster_subnet_pub_2.id
  ]
}