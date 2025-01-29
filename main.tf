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
}

# 3º
module "subnet" {
  source                    = "./modules/subnet"

  depends_on                = [
    module.vpc
  ]

  aws_availability_zone_us_east_1a_name = data.aws_availability_zone.us-east-1a.name
  aws_availability_zone_us_east_1b_name = data.aws_availability_zone.us-east-1b.name
  eks_vpc_id = module.vpc.eks_vpc_id
}

# 4º
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

# 5º
module "rt" {
  source = "./modules/rt"

  depends_on = [
    module.vpc,
    module.ig
  ]

  eks_internet_gateway_id = module.ig.eks_internet_gateway_id
  eks_vpc_id = module.vpc.eks_vpc_id
}

# 6º
module "rta" {
  source = "./modules/rta"

  depends_on = [
    module.subnet,
    module.rt
  ]

  eks_route_table_id = module.rt.eks_route_table_id
  eks_public_subnets_ids = module.subnet.eks_public_subnet_ids
  eks_private_subnets_ids = module.subnet.eks_public_subnet_ids
}

# 7º
module "sqs" {
  source = "./modules/sqs"

  aws_s3_bucket_fiap_mpeg_processor_in_arn  = module.s3.aws_s3_bucket_fiap_mpeg_processor_in_arn
  aws_s3_bucket_fiap_mpeg_processor_out_arn = module.s3.aws_s3_bucket_fiap_mpeg_processor_out_arn
}

# 8º
module "ecr" {
  source                    = "./modules/ecr"
}

# 9º
module "mongo" {
  source = "./modules/mongo"

  organization_id = data.mongodbatlas_roles_org_id.fiap.org_id
  providers = {
    mongodbatlas = mongodbatlas.mongodbatlas
  }
}

module "s3" {
  source = "./modules/s3"

  aws_sqs_fiap_mpeg_processor_in_arn = module.sqs.request_video_processor_queue_arn
}