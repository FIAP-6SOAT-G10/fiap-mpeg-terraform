variable "redshift_public_subnet_ids" {
  type    = list(string)
  default = null
}

variable "rds_customer_public_subnet_ids" {
  type    = list(object({id:string}))
  default = null
}

variable "rds_product_public_subnet_ids" {
  type    = list(object({id:string}))
  default = null
}

variable "eks_route_table_id" {
  type    = string
  default = null
}

variable "redshift_route_table_id" {
  type    = string
  default = null
}

variable "rds_route_table_id" {
  type    = string
  default = null
}

variable "eks_public_subnets_ids" {
  type    = list(string)
  default = null
}

variable "eks_private_subnets_ids" {
  type    = list(string)
  default = null
}