output "eks-endpoint" {
    description = "AWS EKS Endpoint "
    value       = aws_eks_cluster.fiap_fast_food_eks.endpoint
}

output "lab-role" {
    description = "Lab Role"
    value       = data.aws_iam_role.lab_role
}

output "vpc_configs" {
    description = "VPCs"
    value       = aws_eks_cluster.fiap_fast_food_eks.vpc_config
}

output "redis_endpoint" {
    description = "Redis Endpoint"
    value       = aws_elasticache_replication_group.redis_product_category.primary_endpoint_address
}