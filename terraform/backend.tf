terraform {
  backend "s3" {
    bucket         = "remote-backend"      
    key            = "eks_project/terraform.tfstate"  
    region         = "eu-west-2"              
    dynamodb_table = "terraform-locks"         
    encrypt        = true                      
  }
}
