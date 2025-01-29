output "eks_vpc_id" {
  description = "EKS VPC Id"
  value       = aws_vpc.eks_vpc.id
}