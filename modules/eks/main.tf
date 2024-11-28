resource "aws_eks_cluster" "fiap_fast_food_eks" {
  name     = "fiap_fast_food_eks"
  role_arn = var.lab_role_arn

  vpc_config {
    endpoint_public_access    = true
    endpoint_private_access   = false

    subnet_ids = [
      var.eks_private_subnet_id_1,
      var.eks_private_subnet_id_2,
      var.eks_public_subnet_id_1,
      var.eks_public_subnet_id_2
    ]

    public_access_cidrs     = ["0.0.0.0/0"]
  }

  depends_on = [
    var.worker_node_policy,
    var.cni_policy,
    var.container_reg_ro_policy
  ]
}

resource "aws_eks_node_group" "fiap_fast_food_node_group_public" {
  cluster_name    = aws_eks_cluster.fiap_fast_food_eks.name
  node_group_name = "fiap_fast_food_public"
  node_role_arn   = var.lab_role_arn
  subnet_ids      = [
    var.eks_public_subnet_id_1
  ]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  instance_types = ["t3.medium"]

  depends_on = [
    var.worker_node_policy,
    var.cni_policy,
    var.container_reg_ro_policy
  ]
}