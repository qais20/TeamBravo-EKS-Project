variable "aws_vpc_id" {
  type        = string
  description = "This is my vpc id."
  default  = ""
}

variable "vpc_cidr" {
  type        = string
  description = "The cidr block for my vpc."
  default  = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type        = string
  description = "This is the cidr block for my public subnet."
  default  = "10.0.1.0/24"
}

variable "zone_1" {
  type        = string
  description = "This is the availibility zone for my public subnet."
  default  = "eu-west-2a"
}

variable "private_subnet_cidr" {
  type        = string
  description = "This is the cidr block for private subnet."
  default  = "10.0.2.0/24"
}

variable "zone_2" {
  type        = string
  description = "This is the availibility zone for my private subnet."
  default  = "eu-west-2b"
}

variable "public_subnet_id" {
type            = string
description     = "This is the id for my public subnet"
default = ""
}

variable "private_subnet_id" {
type            = string
description     = "This is the id for my private subnet"
default = ""
}

 variable "route_cidr" {
  type          = string
  description   = "this is my route cidr for our route table"
  default = "10.0.1.0/24"         
 }

variable "igw_id" {
 type         = string
 description  = "my internet gateway's id"
 default  = ""
}

variable "natgw_id" {
 type         = string
 description  = "our nat gatway's id"
 default  = ""
}

variable "route_table_id" {
type           = string
description    = "This is the id of our route table"
default = ""
}

variable "eks_cluster_name" {
type         = string
description  = "This is the name for our cluster"
default      = ""
}

variable "security_group_id" {
type         = string
description  = "This is the sg for our cluster"
default      = ""
}

variable "ingress_rule_cidr" {
type         = string
description  = "This is for our ingress rule sg"
default      = "10.0.0.0/8"
}

variable "tm_cidr" {
type         = string
description  = "This is the name for our cluster"
default      = "0.0.0.0/0"
}
