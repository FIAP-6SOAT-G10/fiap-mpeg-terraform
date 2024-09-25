resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.primary.id

  tags = {
    Name = "Public Internet Gateway"
  }
}

resource "aws_eip" "lb" {
  depends_on    = [aws_internet_gateway.internet_gateway]
}

resource "aws_nat_gateway" "nat_internet_gateway" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.subnet-cluster-1.id

  depends_on = [aws_internet_gateway.internet_gateway]
  tags = {
    Name = "NAT Gateway"
  }
}