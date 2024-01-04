terraform {
  required_version = "> 1.4.4"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.17.0"
    }
  }
  backend "s3" {
    bucket         = "dev-tf-state-6d7e0711353df7ed"
    key            = "terraform/terraform_locks_sampleapp.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform_locks_sampleapp"
    encrypt        = "true"
  }
}
