output "eks-endpoint" {
  description = "AWS EKS Endpoint "
  value       = aws_eks_cluster.fiap_fast_food_eks.endpoint
}

output "eks-cluster-security-group-id" {
  description = "AWS EKS Cluster Security Group Id"
  value       = aws_eks_cluster.fiap_fast_food_eks.vpc_config[0].cluster_security_group_id
}