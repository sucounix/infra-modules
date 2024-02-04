data "aws_ssm_parameter" "analysis-nlb" {
  name        = "/${var.environment}/tf-eks/analysis-nlb"
}

data "aws_ssm_parameter" "report-nlb" {
  name        = "/${var.environment}/tf-eks/report-nlb"
}

data "aws_ssm_parameter" "subscribetion-nlb" {
  name        = "/${var.environment}/tf-eks/subscription-nlb"
}

data "aws_ssm_parameter" "astra-nlb" {
  name        = "/${var.environment}/tf-eks/astra-nlb"
}

