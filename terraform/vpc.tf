resource "aws_vpc" "eks-vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "public" {
  vpc_id                  = var.aws_vpc_id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.zone_1
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = var.aws_vpc_id
  cidr_block = var.private_subnet_cidr
  availability_zone = var.zone_2

  tags = {
    Name = "private-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = var.aws_vpc_id

  tags = {
    Name = "for-public-subnet"
  }
}

resource "aws_nat_gateway" "nat-gw" {
  connectivity_type = "private"
  subnet_id         = var.private_subnet_id
}

resource "aws_route_table" "example" {
  vpc_id = var.aws_vpc_id

  route {
    cidr_block = var.route_cidr
    gateway_id = var.igw_id
  }

  route {
    ipv6_cidr_block        = "::/0"
  }

  tags = {
    Name = "for-eks-vpc"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = var.public_subnet_id
  route_table_id = var.route_table_id
}

resource "aws_route_table_association" "a" {
  subnet_id      = var.private_subnet_id
  route_table_id = var.route_table_id
}

resource "aws_route_table_association" "b" {
  gateway_id     = var.igw_id
  route_table_id = var.route_table_id
}



