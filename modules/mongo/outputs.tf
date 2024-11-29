output "standard" {
  value = mongodbatlas_cluster.order_cluster.connection_strings[0].standard_srv
}