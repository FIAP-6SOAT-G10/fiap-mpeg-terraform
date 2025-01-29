resource "aws_subnet" "eks_cluster_subnet_pub_1" {
  vpc_id                                        = var.eks_vpc_id
  cidr_block                                    = "192.168.0.0/22"
  availability_zone                             = var.aws_availability_zone_us_east_1a_name
#   depends_on                                    = [aws_internet_gateway.eks_internet_gateway]
  map_public_ip_on_launch                       = true
  tags = {
    Name                                        = "EKS Cluster Subnet Public 1",
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/fiap_mpeg_eks"       = "shared"
  }
}

resource "aws_subnet" "eks_cluster_subnet_pub_2" {
  vpc_id                                        = var.eks_vpc_id
  cidr_block                                    = "192.168.4.0/22"
  availability_zone                             = var.aws_availability_zone_us_east_1b_name
  map_public_ip_on_launch                       = true
  tags = {
    Name                                        = "EKS Cluster Subnet Public 2",
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/fiap_mpeg_eks"       = "shared"
  }
}

resource "aws_subnet" "eks_cluster_subnet_pvt_1" {
  vpc_id                                        = var.eks_vpc_id
  cidr_block                                    = "192.168.8.0/22"
  availability_zone                             = var.aws_availability_zone_us_east_1a_name
  map_public_ip_on_launch                       = true
  tags                                          = {
    Name                                        = "EKS Cluster Subnet Private 1",
    "kubernetes.io/cluster/fiap_mpeg_eks"  = "shared"
  }
}

resource "aws_subnet" "eks_cluster_subnet_pvt_2" {
  vpc_id                                        = var.eks_vpc_id
  cidr_block                                    = "192.168.12.0/22"
  availability_zone                             = var.aws_availability_zone_us_east_1b_name
  map_public_ip_on_launch                       = true
  tags                                          = {
    Name                                        = "EKS Cluster Subnet Private 2",
    "kubernetes.io/cluster/fiap_mpeg_eks"  = "shared"
  }
}