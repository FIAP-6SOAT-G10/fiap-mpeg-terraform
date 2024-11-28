output "eks_internet_gateway_id" {
  value = aws_internet_gateway.eks_internet_gateway.id
}

output "redshift_internet_gateway_id" {
  value = aws_internet_gateway.redshift_internet_gateway.id
}

output "rds_internet_gateway_id" {
  value = aws_internet_gateway.rds_internet_gateway.id
}