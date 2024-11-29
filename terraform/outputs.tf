output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "The public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "The private subnet IDs"
  value       = module.vpc.private_subnet_ids
}


output "security_group_ids" {
  description = "Security group IDs used by EKS and VPC"
  value       = module.vpc.security_group_ids
}
output "eks_cluster_id" {
  description = "The ID of the EKS cluster"
  value       = module.eks.cluster_id
}

output "eks_cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.cluster_name
}


output "public_subnet2_ids" {
  value = module.vpc.public_subnet2_ids
}

