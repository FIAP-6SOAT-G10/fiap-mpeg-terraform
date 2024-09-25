resource "aws_subnet" "subnet-msv-1a" {
  vpc_id     = aws_vpc.primary.id
  cidr_block = cidrsubnet("192.168.0.0/17", 1, var.region_number[data.aws_availability_zone.us-east-1a.region])
  availability_zone = data.aws_availability_zone.us-east-1a.name

  tags = {
    Name = "Public Subnet 1"
  }
}

resource "aws_subnet" "subnet-msv-1b" {
  vpc_id     = aws_vpc.primary.id
  cidr_block = cidrsubnet("192.168.1.0/18", 1, var.region_number[data.aws_availability_zone.us-east-1b.region])
  availability_zone = data.aws_availability_zone.us-east-1b.name

  tags = {
    Name = "Public Subnet 2"
  }
}

resource "aws_subnet" "subnet-msv-2a" {
  vpc_id     = aws_vpc.primary.id
  cidr_block = cidrsubnet("192.168.2.0/19", 1, var.region_number[data.aws_availability_zone.us-east-1a.region])
  availability_zone = data.aws_availability_zone.us-east-1a.name

  tags = {
    Name = "Public Subnet 3"
  }
}

resource "aws_subnet" "subnet-msv-2b" {
  vpc_id     = aws_vpc.primary.id
  cidr_block = cidrsubnet("192.168.3.0/20", 1, var.region_number[data.aws_availability_zone.us-east-1b.region])
  availability_zone = data.aws_availability_zone.us-east-1b.name

  tags = {
    Name = "Public Subnet 4"
  }
}