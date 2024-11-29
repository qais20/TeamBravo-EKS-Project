variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "public_subnet2_cidr" {
  description = "CIDR block for the second public subnet"
  type        = string
}

variable "zone_1" {
  description = "Availability zone for the public subnet"
  type        = string
}

variable "zone_2" {
  description = "Availability zone for the private subnet"
  type        = string
}

variable "zone_3" {
  description = "Availability zone for the second public subnet"
  type        = string
}

variable "tm_cidr" {
  description = "CIDR blocks for threat model ingress"
  type        = list(string)
}
