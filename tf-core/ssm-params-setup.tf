resource "aws_ssm_parameter" "tf-eks-id" {
  name        = "/${var.environment}/tf-eks/id"
  description = "The unique id for the workshop"
  type        = "String"
  value       = random_id.id1.hex

  tags = {
    workshop = "tf-eks/${var.environment}"
  }
}

resource "aws_ssm_parameter" "tf-eks-keyid" {
  name        = "/${var.environment}/tf-eks/keyid"
  description = "The keyid for the workshop"
  type        = "String"
  value       = aws_kms_key.ekskey.key_id

  tags = {
    workshop = "tf-eks-workshop"
  }
}

resource "aws_ssm_parameter" "tf-eks-keyarn" {
  name        = "/${var.environment}/tf-eks/keyarn"
  description = "The keyid for the workshop"
  type        = "String"
  value       = aws_kms_key.ekskey.arn

  tags = {
    workshop = "tf-eks-workshop"
  }
}

resource "aws_ssm_parameter" "tf-eks-region" {
  name        = "/${var.environment}/tf-eks/region"
  description = "The region for the workshop"
  type        = "String"
  value       = var.region

  tags = {
    workshop = "tf-eks-workshop"
  }
}

resource "aws_ssm_parameter" "tf-eks-cluster-name" {
  name        = "/${var.environment}/tf-eks/cluster-name"
  description = "The EKS cluster name for the workshop"
  type        = "String"
  value       = var.cluster-name

  tags = {
    workshop = "tf-eks-workshop"
  }
}

resource "aws_ssm_parameter" "tf-eks-buck-name" {
  name        = "/${var.environment}/tf-eks/bucket-name"
  description = "The Terraform State bucket name for the workshop"
  type        = "String"
  value       = aws_s3_bucket.terraform_state.bucket

  tags = {
    workshop = "tf-eks-workshop"
  }
}

resource "aws_ssm_parameter" "tf-eks-version" {
  name        = "/${var.environment}/tf-eks/eks-version"
  description = "The EKS Version"
  type        = "String"
  value       = var.eks_version

  tags = {
    workshop = "tf-eks-workshop"
  }
}

resource "aws_ssm_parameter" "environment" {
  name        = "/environment"
  description = "The EKS Version"
  type        = "String"
  value       = var.environment

  tags = {
    workshop = "tf-eks-workshop"
  }
}