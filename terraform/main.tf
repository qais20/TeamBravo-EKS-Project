module "vpc" {
  source              = "./modules/vpc"
  vpc_name            = "eks-vpc"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  public_subnet2_cidr = var.public_subnet2_cidr
  private_subnet_cidr = var.private_subnet_cidr
  zone_1              = var.zone_1
  zone_2              = var.zone_2
  zone_3              = var.zone_3         
  tm_cidr             = var.tm_cidr
}

module "eks" {
  source              = "./modules/eks"
  cluster_name        = var.eks_cluster_name
  vpc_id              = module.vpc.vpc_id
  subnet_ids          = module.vpc.public_subnet_ids 
  subnet2_ids         = module.vpc.public_subnet2_ids
  private_access      = true
  public_access       = true
  enable_irsa         = true
  instance_types      = ["t3.medium"]
  security_group_ids  = module.vpc.security_group_ids

  managed_node_groups = {
    default = {
      min_size     = 2
      max_size     = 6
      desired_size = 3
    }
  }

  tags = {
    environment = "development"
  }
}

