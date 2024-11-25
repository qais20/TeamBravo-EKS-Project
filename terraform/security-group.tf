resource "aws_security_group" "for-eks" {
  name        = "for-eks"
  description = "our security group for eks cluster"
  vpc_id      = var.aws_vpc_id
  tags = {
    Name = "example"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ingress_rule" {
  security_group_id = var.security_group_id

  cidr_ipv4   = var.ingress_rule_cidr
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_security_group" "tm_sg" {
  name        = 
  description = "Security group for threat model"
  vpc_id      = var.aws_vpc_id

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
    cidr_blocks = var.tm_cidr
  }

  tags = {
    Name = "tm_security_group"
  }
}