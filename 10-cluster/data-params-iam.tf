data "aws_ssm_parameter" "cluster_service_role_arn" {
  name        = "/${var.environment}/tf-eks/cluster_service_role_arn"
}

data "aws_ssm_parameter" "nodegroup_role_arn" {
  name        = "/${var.environment}/tf-eks/nodegroup_role_arn"
}

data "aws_ssm_parameter" "key_name" {
  name        = "/${var.environment}/tf-eks/key_name"
}
