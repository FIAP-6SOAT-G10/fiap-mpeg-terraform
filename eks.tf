resource "aws_eks_cluster" "fiap_fast_food_eks" {
  name     = "fiap_fast_food_eks"
  version  = 1.25
  role_arn = var.lab_role

  vpc_config {
    endpoint_public_access    = true
    endpoint_private_access   = true
    security_group_ids        = [
      #aws_security_group.sg_fiap_fast_food.id
      
    ]
    subnet_ids = [
      aws_subnet.subnet-msv-1a.id,
      aws_subnet.subnet-msv-1b.id,
      aws_subnet.subnet-msv-2a.id,
      aws_subnet.subnet-msv-2b.id
    ]
  }

  depends_on = [
    data.aws_iam_policy.cluster_policy,
    data.aws_iam_policy.resource_controller,
    data.aws_iam_policy.worker_node_policy,
    data.aws_iam_policy.cni_policy,
    data.aws_iam_policy.container_registry_read_only_policy
  ]
}

resource "aws_eks_node_group" "fiap_fast_food_node_group" {
  cluster_name    = aws_eks_cluster.fiap_fast_food_eks.name
  node_group_name = "fiap_fast_food"
  node_role_arn   = data.aws_iam_role.lab_role.arn
  subnet_ids      = [
    aws_subnet.subnet-msv-1a.id,
    aws_subnet.subnet-msv-1b.id,
    aws_subnet.subnet-msv-2a.id,
    aws_subnet.subnet-msv-2b.id
  ]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  instance_types = ["t3.medium"]

  depends_on = [
    aws_eks_cluster.fiap_fast_food_eks,
    data.aws_iam_policy.worker_node_policy,
    data.aws_iam_policy.cni_policy,
    data.aws_iam_policy.container_registry_read_only_policy,
  ]
}

resource "aws_eks_addon" "addon_vpn_cni" {
  cluster_name = aws_eks_cluster.fiap_fast_food_eks.name
  addon_name   = "vpc-cni"
}