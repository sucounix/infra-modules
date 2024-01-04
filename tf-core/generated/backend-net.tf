terraform {
  required_version = "> 1.4.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #  Lock version to avoid unexpected problems
      version = "5.31.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.24.0"
    }
  }
  backend "s3" {
    bucket         = "tf-state-workshop-8e73204021604753"
    key            = "terraform/terraform_locks_net.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform_locks_net"
    encrypt        = "true"
  }
}
provider "aws" {
  region                   = var.region
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = var.profile
}
