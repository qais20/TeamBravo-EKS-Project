terraform {
  backend "s3" {
    bucket         = "remote-backend21"
    key            = "eks_project/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

