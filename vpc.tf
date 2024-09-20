resource "aws_vpc" "primary" {
  cidr_block = "192.168.0.0/16"

  tags = {
    Name = "Private VPC"
  }
}

resource "aws_vpc" "secondary" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Public VPC"
  }
}