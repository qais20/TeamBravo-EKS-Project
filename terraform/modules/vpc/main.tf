# resource "aws_vpc" "eks_vpc" {
#   cidr_block = var.vpc_cidr

#   tags = {
#     Name = var.vpc_name
#   }
# }

# resource "aws_subnet" "public" {
#   vpc_id                  = aws_vpc.eks_vpc.id
#   cidr_block              = var.public_subnet_cidr
#   availability_zone       = var.zone_1
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "public-subnet"
#   }
# }

# resource "aws_route_table_association" "public_subnet" {
#     subnet_id      = aws_subnet.public.id
#     route_table_id = aws_route_table.public.id
#   }

# resource "aws_subnet" "private" {
#   vpc_id            = aws_vpc.eks_vpc.id
#   cidr_block        = var.private_subnet_cidr
#   availability_zone = var.zone_2

#   tags = {
#     Name = "private-subnet"
#   }
# }

# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.eks_vpc.id

#   tags = {
#     Name = "eks-internet-gateway"
#   }
# }

# resource "aws_nat_gateway" "nat_gw" {
#   allocation_id = aws_eip.nat.allocation_id
#   subnet_id     = aws_subnet.public.id

#   tags = {
#     Name = "eks-nat-gateway"
#   }
# }

# resource "aws_security_group" "for_eks" {
#   name        = "for-eks"
#   description = "Security group for EKS cluster"
#   vpc_id      = aws_vpc.eks_vpc.id

#   tags = {
#     Name = "eks-cluster-security-group"
#   }
# }

# resource "aws_security_group" "tm_sg" {
#   name        = "tm-security-group"
#   description = "Security group for threat model"
#   vpc_id      = aws_vpc.eks_vpc.id

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = var.tm_cidr
#   }

#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = var.tm_cidr
#   }

#   ingress {
#     from_port   = 3000
#     to_port     = 3000
#     protocol    = "tcp"
#     cidr_blocks = var.tm_cidr
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "tm-security-group"
#   }
# }

# resource "aws_eip" "nat" {
#   tags = {
#     Name = "eks-nat-eip"
#   }
# }


# resource "aws_subnet" "public2" {
#   vpc_id                  = aws_vpc.eks_vpc.id
#   cidr_block              = var.public_subnet2_cidr
#   availability_zone       = var.zone_3
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "public-subnet2"
#   }
# }

# resource "aws_route_table" "public2" {
#   vpc_id = aws_vpc.eks_vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }

#   tags = {
#     Name = "public-route-table2"
#   }
# }

# resource "aws_route_table_association" "public_subnet2" {
#   subnet_id      = aws_subnet.public2.id
#   route_table_id = aws_route_table.public2.id
# }


resource "aws_vpc" "eks_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.zone_1
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public_subnet" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.zone_2

  tags = {
    Name = "private-subnet"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "private-route-table"
  }
}

resource "aws_route_table_association" "private_subnet" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = {
    Name = "eks-internet-gateway"
  }
}

resource "aws_eip" "nat" {
  tags = {
    Name = "eks-nat-eip"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat.allocation_id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "eks-nat-gateway"
  }
}

resource "aws_subnet" "public2" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = var.public_subnet2_cidr
  availability_zone       = var.zone_3
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet2"
  }
}

resource "aws_route_table_association" "public_subnet2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "for_eks" {
  name        = "for-eks"
  description = "Security group for EKS cluster"
  vpc_id      = aws_vpc.eks_vpc.id

  tags = {
    Name = "eks-cluster-security-group"
  }
}

resource "aws_security_group" "tm_sg" {
  name        = "tm-security-group"
  description = "Security group for threat model"
  vpc_id      = aws_vpc.eks_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.tm_cidr
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.tm_cidr
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = var.tm_cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tm-security-group"
  }
}
