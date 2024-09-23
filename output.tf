output "eks-endpoint" {
    description = "EKS Endpoint"
    value       = aws_eks_cluster.fiap_fast_food_eks.endpoint
}

output "ecr-registry" {
    description = "ECR Registry ID"
    value       = aws_ecr_repository.fiap_fast_food_app.registry_id
}

output "ecr-repository-url" {
    description = "ECR Repository URL"
    value       = aws_ecr_repository.fiap_fast_food_app.repository_url
}

output "elb-internal-dns-url" {
    description = "Internal ELB DNS"
    value       = aws_elb.internal_fiap_fast_food_elb.dns_name
}

output "lab-role" {
    description = "Lab Role"
    value       = data.aws_iam_role.lab_role
}