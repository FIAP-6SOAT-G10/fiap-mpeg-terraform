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

output "redshift_public_subnet_ids" {
  value = [
    aws_subnet.redshift_cluster_subnet_pub_1.id,
    aws_subnet.redshift_cluster_subnet_pub_2.id
  ]
}

output "elastic_cache_private_subnet_ids" {
  value = [
    aws_subnet.elastic_cache_subnet_pvt_1.id
  ]
}

output "rds_customer_public_subnet_ids" {
  value = [
    aws_subnet.rds_customer_subnet_pub_1,
    aws_subnet.rds_customer_subnet_pub_2
  ]
}

output "rds_product_public_subnet_ids" {
  value = [
    aws_subnet.rds_product_subnet_pub_1,
    aws_subnet.rds_product_subnet_pub_2
  ]
}

output "rds_customer_subnet_group_name" {
  value = aws_db_subnet_group.rds_customer_subnet_group.name
}

output "rds_product_subnet_group_name" {
  value = aws_db_subnet_group.rds_product_subnet_group.name
}

output "elastic_cache_subnet_group_name" {
  value = aws_elasticache_subnet_group.elastic_cache_subnet_group.name
}

output "redshift_subnet_group_id" {
  value = aws_redshift_subnet_group.redshift_subnet_group.id
}