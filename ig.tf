resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.secondary.id

  tags = {
    Name = "Public Internet Gateway"
  }
}