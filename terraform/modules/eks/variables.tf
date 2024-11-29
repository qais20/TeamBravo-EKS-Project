variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the EKS cluster will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "subnet2_ids" {
  description = "List of IDs"
  type        = list(string)
}


variable "private_access" {
  description = "Enable private access to the EKS cluster endpoint"
  type        = bool
  default     = true
}

variable "public_access" {
  description = "Enable public access to the EKS cluster endpoint"
  type        = bool
  default     = true
}

variable "enable_irsa" {
  description = "Enable IRSA (IAM Roles for Service Accounts) on the EKS cluster"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to apply to the EKS cluster"
  type        = map(string)
  default     = {
    environment = "development"
  }
}

variable "ami_type" {
  description = "AMI type for managed node groups"
  type        = string
  default     = "AL2_x86_64"
}

variable "instance_types" {
  description = "List of instance types for managed node groups"
  type        = list(string)
  default     = ["t3.medium"]
}


variable "managed_node_groups" {
  description = "Configuration for managed node groups"
  type = map(object({
    min_size     = number
    max_size     = number
    desired_size = number
  }))
  default = {
    default = {
      min_size     = 2
      max_size     = 6
      desired_size = 3
    }
  }
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}
