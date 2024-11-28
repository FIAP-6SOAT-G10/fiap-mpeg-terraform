output "eks_vpc_id" {
  description = "EKS VPC Id"
  value       = aws_vpc.eks_vpc.id
}

output "redshift_vpc_id" {
  description = "Redshift VPC Id"
  value       = aws_vpc.redshift_vpc.id
}

output "elastic_cache_vpc_id" {
  description = "Elastic Cache VPC Id"
  value       = aws_vpc.elastic_cache_vpc.id
}

output "rds_vpc_id" {
  description = "RDS VPC Id"
  value       = aws_vpc.rds_vpc.id
}