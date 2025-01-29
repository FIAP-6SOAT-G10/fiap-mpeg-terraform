variable "eks_route_table_id" {
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