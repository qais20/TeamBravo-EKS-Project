module "eks" {
  source       = "terraform-aws-modules/eks/aws"
  version      = "20.29.0"
  cluster_name = var.eks_cluster_name
  subnet_ids   = [var.public_subnet_id , var.private_subnet_id]


enable_irsa = true

tags = {
  cluster = "eks"
}



eks_managed_node_group_defaults = {
  ami_type               = "AL2_x86_64"
  instance_types         = ["t2.micro"]
  vpc_security_group_ids = []
}


eks_managed_node_groups = {


node_group = {
  min_size     = 2
  max_size     = 6
  desired size = 2
}
}
}

