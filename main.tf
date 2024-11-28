# 1º
module "vpc" {
  source                    = "./modules/vpc"
}

# 2º
module "ig" {
  source                    = "./modules/ig"

  depends_on                = [
    module.vpc
  ]

  eks_vpc_id                = module.vpc.eks_vpc_id
  redshift_vpc_id           = module.vpc.redshift_vpc_id
  elastic_cache_vpc_id      = module.vpc.elastic_cache_vpc_id
  rds_vpc_id                = module.vpc.rds_vpc_id
}

# 3º
module "sg" {
  source = "./modules/sg"

  depends_on = [
    module.vpc
  ]

  eks_vpc_id = module.vpc.eks_vpc_id
  redshift_vpc_id = module.vpc.redshift_vpc_id
  rds_vpc_id = module.vpc.rds_vpc_id
  elastic_cache_vpc_id = module.vpc.elastic_cache_vpc_id
}

# 4º
module "subnet" {
  source                    = "./modules/subnet"

  depends_on                = [
    module.vpc
  ]

  aws_availability_zone_us_east_1a_name = data.aws_availability_zone.us-east-1a.name
  aws_availability_zone_us_east_1b_name = data.aws_availability_zone.us-east-1b.name
  eks_vpc_id = module.vpc.eks_vpc_id
  redshift_vpc_id = module.vpc.redshift_vpc_id
  rds_vpc_id = module.vpc.rds_vpc_id
  elastic_cache_vpc_id = module.vpc.elastic_cache_vpc_id
}

# 5º
module "eks" {
  source                    = "./modules/eks"

  depends_on                = [
    module.subnet
  ]

  lab_role_arn              = data.aws_iam_role.lab_role.arn
  eks_private_subnet_id_1   = module.subnet.eks_private_subnet_ids[0]
  eks_private_subnet_id_2   = module.subnet.eks_private_subnet_ids[1]
  eks_public_subnet_id_1    = module.subnet.eks_public_subnet_ids[0]
  eks_public_subnet_id_2    = module.subnet.eks_public_subnet_ids[1]
  worker_node_policy        = data.aws_iam_policy.worker_node_policy.name
  cni_policy                = data.aws_iam_policy.cni_policy.name
  container_reg_ro_policy   = data.aws_iam_policy.container_registry_read_only_policy.name
}

# 6º
module "pg" {
  source = "./modules/pg"
}

# 7º
module "rds" {
  source = "./modules/rds"

  depends_on = [
    module.subnet,
    module.sg,
    module.pg
  ]

  rds_customer_subnet_group_name = module.subnet.rds_customer_subnet_group_name
  rds_customer_security_group_id = module.sg.rds_customer_security_group_id
  rds_customer_parameter_group_name = module.pg.rds_customer_parameter_group_name

  rds_product_subnet_group_name = module.subnet.rds_product_subnet_group_name
  rds_product_security_group_id = module.sg.rds_product_security_group_id
  rds_product_parameter_group_name = module.pg.rds_product_parameter_group_name
}

# 8º
module "redis" {
  source = "./modules/redis"

  depends_on = [
    module.subnet,
    module.sg
  ]

  elastic_cache_subnet_group_name = module.subnet.elastic_cache_subnet_group_name
  elastic_cache_product_category_security_group_id = module.sg.elastic_cache_product_category_security_group_id
}

# 9º
module "redshift" {
  source = "./modules/redshift"

  depends_on = [
    module.subnet,
    module.sg
  ]

  redshift_subnet_group_id = module.subnet.redshift_subnet_group_id
  redshift_security_group_id = module.sg.redshift_security_group_id
  lab_role_arn = data.aws_iam_role.lab_role.arn
}

# 10º
module "rt" {
  source = "./modules/rt"

  depends_on = [
    module.vpc,
    module.ig
  ]

  eks_internet_gateway_id = module.ig.eks_internet_gateway_id
  redshift_internet_gateway_id = module.ig.redshift_internet_gateway_id
  rds_internet_gateway_id = module.ig.rds_internet_gateway_id
  eks_vpc_id = module.vpc.eks_vpc_id
  redshift_vpc_id = module.vpc.redshift_vpc_id
  rds_vpc_id = module.vpc.rds_vpc_id
}

# 11º
module "rta" {
  source = "./modules/rta"

  depends_on = [
    module.subnet,
    module.rt
  ]

  redshift_public_subnet_ids = module.subnet.redshift_public_subnet_ids
  rds_customer_public_subnet_ids = module.subnet.rds_customer_public_subnet_ids
  rds_product_public_subnet_ids = module.subnet.rds_product_public_subnet_ids
  eks_route_table_id = module.rt.eks_route_table_id
  redshift_route_table_id = module.rt.redshift_route_table_id
  rds_route_table_id = module.rt.rds_route_table_id
  eks_public_subnets_ids = module.subnet.eks_public_subnet_ids
  eks_private_subnets_ids = module.subnet.eks_public_subnet_ids
}


module "sns" {
  source = "./modules/sns"

  order_payment_updates_queue_arn = module.sqs.order_payment_updates_queue_arn
  production_payment_updates_queue_arn = module.sqs.production_payment_updates_queue_arn
}

module "sqs" {
  source = "./modules/sqs"

  payment_updates_arn = module.sns.payment_updates_arn
}

module "ecr" {
  source                    = "./modules/ecr"
}