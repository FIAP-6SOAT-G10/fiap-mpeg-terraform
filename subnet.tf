resource "aws_subnet" "subnet-apps" {
  vpc_id                  = aws_vpc.primary.id
  cidr_block              = "192.168.0.0/27"
  availability_zone       = data.aws_availability_zone.us-east-1a.name
  depends_on              = [aws_internet_gateway.internet_gateway]
  map_public_ip_on_launch = true 
  tags = {
    Name = "Public Subnet Apps 1"
  }
}

resource "aws_subnet" "subnet-cluster-1" {
  vpc_id                  = aws_vpc.primary.id
  cidr_block              = "192.168.0.32/27"
  availability_zone       = data.aws_availability_zone.us-east-1a.name
  map_public_ip_on_launch = true 
  tags = {
    Name = "Public Subnet Cluster 1",
    "kubernetes.io/cluster/fiap_fast_food_eks" = "shared"
  }
}

resource "aws_subnet" "subnet-cluster-2" {
  vpc_id                  = aws_vpc.primary.id
  cidr_block              = "192.168.0.64/27"
  availability_zone       = data.aws_availability_zone.us-east-1b.name
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet Cluster 2",
    "kubernetes.io/cluster/fiap_fast_food_eks" = "shared"
  }
}

#resource "aws_subnet" "subnet-msv-2a" {
#  vpc_id     = aws_vpc.primary.id
#  cidr_block = cidrsubnet("192.168.2.0/19", 1, var.region_number[data.aws_availability_zone.us-east-1a.region])
#  availability_zone = data.aws_availability_zone.us-east-1a.name
#
#  tags = {
#    Name = "Public Subnet 3"
#  }
#}

#resource "aws_subnet" "subnet-msv-2b" {
#  vpc_id     = aws_vpc.primary.id
#  cidr_block = cidrsubnet("192.168.3.0/20", 1, var.region_number[data.aws_availability_zone.us-east-1b.region])
#  availability_zone = data.aws_availability_zone.us-east-1b.name
#
#  tags = {
#    Name = "Public Subnet 4"
#  }
#}