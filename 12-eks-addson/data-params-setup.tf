# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
data "aws_ssm_parameter" "tf-eks-id" {
  name = "/dev/tf-eks/id"
}

data "aws_ssm_parameter" "tf-eks-keyid" {
  name = "/dev/tf-eks/keyid"
}

data "aws_ssm_parameter" "tf-eks-keyarn" {
  name = "/dev/tf-eks/keyarn"
}

data "aws_ssm_parameter" "tf-eks-region" {
  name = "/dev/tf-eks/region"
}

data "aws_ssm_parameter" "tf-eks-cluster-name" {
  name = "/dev/tf-eks/cluster-name"
}

data "aws_ssm_parameter" "tf-eks-version" {
  name = "/dev/tf-eks/eks-version"
}

data "aws_ssm_parameter" "environment" {
  name = "/dev/environment"
}

