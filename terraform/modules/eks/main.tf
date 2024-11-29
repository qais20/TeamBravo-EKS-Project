module "eks" {
  source       = "terraform-aws-modules/eks/aws"
  version      = "20.29.0"

  cluster_name = var.cluster_name
  vpc_id       = var.vpc_id
  subnet_ids = concat(var.subnet_ids, var.subnet2_ids)


  cluster_endpoint_private_access = var.private_access
  cluster_endpoint_public_access  = var.public_access

  enable_irsa = var.enable_irsa

  tags = var.tags

  eks_managed_node_group_defaults = {
    ami_type               = var.ami_type
    instance_types         = var.instance_types
    vpc_security_group_ids = var.security_group_ids
  }

  eks_managed_node_groups = var.managed_node_groups
}
