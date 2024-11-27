resource "aws_redshift_cluster" "fiap-fast-food-payment-cluster" {
  cluster_identifier        = "payment-cluster"
  database_name             = "payments"
  master_username           = "masteruser"
  master_password           = "M4st3rp455"
  node_type                 = "dc2.large"
  cluster_type              = "single-node"
  cluster_subnet_group_name = aws_redshift_subnet_group.redshift_subnet_group.id
  skip_final_snapshot       = true
  iam_roles                 = [data.aws_iam_role.lab_role.arn]
  vpc_security_group_ids    = [
    aws_security_group.redshift_security_group.id
  ]
  depends_on                = [
    aws_vpc.redshift_vpc,
    aws_security_group.redshift_security_group,
    aws_redshift_subnet_group.redshift_subnet_group,
    data.aws_iam_role.lab_role
  ]
}