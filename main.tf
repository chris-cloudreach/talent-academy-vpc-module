# VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr

  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
      Name = var.vpc_name,
      Class = "packer"
  }
}

# INTERNET GATEWAY
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = var.internet_gw_name
  }
}

# SUBNETS
## PUBLIC
resource "aws_subnet" "public_a" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.public_a_cidr
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "talent-academy-public-a"
  }
}

## PRIVATE
resource "aws_subnet" "private_a" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.private_a_cidr
  availability_zone = "${var.region}a"

  tags = {
    Name = "talent-academy-private-a"
    Class = "packer"
  }
}

## NAT GW
resource "aws_eip" "nat_a_eip" {
  domain      = "vpc"
}

resource "aws_nat_gateway" "nat_a" {
  allocation_id = aws_eip.nat_a_eip.id
  subnet_id     = aws_subnet.public_a.id

  tags = {
    Name = "NAT Gateway"
  }

  depends_on = [aws_internet_gateway.internet_gateway]
}
