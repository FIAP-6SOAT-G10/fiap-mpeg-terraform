resource "aws_eks_cluster" "fiap_fast_food_eks" {
  name     = "fiap_fast_food_eks"
  role_arn = var.lab_role

  vpc_config {
    subnet_ids = [
      aws_subnet.subnet-msv-1a.id, 
      aws_subnet.subnet-msv-1b.id, 
      aws_subnet.subnet-msv-2a.id,
      aws_subnet.subnet-msv-2b.id
    ]
  }
  
  #depends_on = [
  #  aws_iam_role_policy_attachment.fiap_fast_food_eks_amazon_eks_cluster_policy,
  #  aws_iam_role_policy_attachment.fiap_fast_food_eks_amazon_eks_resource_controller,
  #]
  depends_on = [
    data.aws_iam_policy.cluster_policy,
    data.aws_iam_policy.resource_controller
  ]
}

#resource "aws_iam_role_policy_attachment" "fiap_fast_food_eks_amazon_eks_cluster_policy" {
#  policy_arn  = data.aws_iam_policy.cluster_policy.arn
#  role        = data.aws_iam_role.lab_role.name
#}

#resource "aws_iam_role_policy_attachment" "fiap_fast_food_eks_amazon_eks_resource_controller" {
#  policy_arn  = data.aws_iam_policy.resource_controller.arn
#  role        = data.aws_iam_role.lab_role.name
#}

#resource "aws_eks_pod_identity_association" "fiap_fast_food_namespace" {
#  cluster_name    = aws_eks_cluster.fiap_fast_food_eks.name
#  namespace       = "fiap-fast-food"
#  service_account = "fiap-fast-food"
#  role_arn        = data.aws_iam_role.lab_role.arn
#}

resource "aws_eks_node_group" "fiap_fast_food_node_group" {
  cluster_name    = aws_eks_cluster.fiap_fast_food_eks.name
  node_group_name = "fiap_fast_food"
  node_role_arn   = data.aws_iam_role.lab_role.arn
  subnet_ids      = [
    aws_subnet.subnet-msv-1a.id, 
    aws_subnet.subnet-msv-1b.id, 
    aws_subnet.subnet-msv-2a.id,
    aws_subnet.subnet-msv-2b.id,
    aws_subnet.subnet-mss-1ap.id,
    aws_subnet.subnet-mss-1ab.id,
    aws_subnet.subnet-mss-2ba.id,
    aws_subnet.subnet-mss-2bb.id
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
    data.aws_iam_policy.worker_node_policy,
    data.aws_iam_policy.cni_policy,
    data.aws_iam_policy.container_registry_read_only_policy,
  ]
}

resource "aws_eks_addon" "addon_vpn_cni" {
  cluster_name = aws_eks_cluster.fiap_fast_food_eks.name
  addon_name   = "vpc-cni"
}