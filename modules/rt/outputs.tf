output "eks_route_table_id" {
  value = aws_route_table.eks_route_table.id
}

output "redshift_route_table_id" {
  value = aws_route_table.redshift_route_table.id
}

output "rds_route_table_id" {
  value = aws_route_table.rds_route_table.id
}