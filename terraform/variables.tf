variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  type        = string
  description = "CIDR block for the private subnet"
  default     = "10.0.2.0/24"
}

variable "zone_1" {
  type        = string
  description = "Availability zone for public subnet"
  default     = "eu-west-2a"
}

variable "zone_2" {
  type        = string
  description = "Availability zone for private subnet"
  default     = "eu-west-2c"
}

variable "tm_cidr" {
  type        = list(string)
  description = "CIDR blocks for threat model ingress"
  default     = ["0.0.0.0/0"]
}

variable "eks_cluster_name" {
  type        = string
  description = "EKS cluster name"
  default     = "eks-cluster"
}

variable "public_subnet2_cidr" {
  default = "10.0.32.0/24"
}



variable "tm_cidr" {
type         = string
description  = "This is the name for our cluster"
default      = "0.0.0.0/0"
}
variable "zone_3" {
  default = "eu-west-2b"
}

