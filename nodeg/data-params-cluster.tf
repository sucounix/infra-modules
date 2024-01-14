data "aws_ssm_parameter" "oidc_provider_arn" {
  name        = "/${var.environment}/tf-eks/oidc_provider_arn"
}

data "aws_ssm_parameter" "cluster-name" {
  name        = "/${var.environment}/tf-eks/cluster-name"
}

data "aws_ssm_parameter" "cluster-sg" {
  name        = "/${var.environment}/tf-eks/cluster-sg"
}

data "aws_ssm_parameter" "ca" {
  name        = "/${var.environment}/tf-eks/ca"
}

data "aws_ssm_parameter" "endpoint" {
  name        = "/${var.environment}/tf-eks/endpoint"
}
