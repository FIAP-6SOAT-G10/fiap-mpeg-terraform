resource "aws_subnet" "subnet-msv-a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet("192.168.0.0/17", 1, var.region_number[data.aws_availability_zone.us-east-1a.region])
  availability_zone = data.aws_availability_zone.us-east-1a.name
}

resource "aws_subnet" "subnet-msv-b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet("192.168.128.0/17", 1, var.region_number[data.aws_availability_zone.us-east-1b.region])
  availability_zone = data.aws_availability_zone.us-east-1b.name
}