variable "lab_role_arn" {
  description = "The role which the Terraform will run"
  type        = string
  default     = null
}

variable "eks_private_subnet_id_1" {
  description = "The set of private subnet ids of EKS cluster"
  type        = string
  default     = null
}

variable "eks_private_subnet_id_2" {
  description = "The set of private subnet ids of EKS cluster"
  type        = string
  default     = null
}

variable "eks_public_subnet_id_1" {
  description = "The set of public subnet ids of EKS cluster"
  type        = string
  default     = null
}

variable "eks_public_subnet_id_2" {
  description = "The set of public subnet ids of EKS cluster"
  type        = string
  default     = null
}

variable "worker_node_policy" {
  description = "The Worker Node Policy"
  type        = string
  default     = null
}

variable "cni_policy" {
  description = "The CNI Policy"
  type        = string
  default     = null
}

variable "container_reg_ro_policy" {
  description = "The Container Registry Read Only Policy"
  type        = string
  default     = null
}