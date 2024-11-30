terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.77.0"
    }
  }
}

provider "aws" {
  
}

# data "aws_eks_cluster" "cluster" {
#   name = module.eks.cluster_name
# }

# provider "helm" {
#   kubernetes {
#     host                   = module.eks.Cluster_endpoint
#     cluster_ca_certificate = we need the cluster certificate 
#     exec {
#       api_version = "client.authentication.k8s.io/v1beta1"
#       args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.cluster.name]
#       command     = "aws"
#     }
#   }
# }