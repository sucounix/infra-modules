resource "aws_ssm_parameter" "analysis-nlb" {
  depends_on  = [ module.nlb ]
  name        = "/${var.environment}/tf-eks/analysis-nlb"
  description = "analysis nlb arn"
  type        = "String"
  value       = module.nlb.listeners["analysis"].arn
  tags = {
    workshop = "tf-eks-workshop"
  }
}

resource "aws_ssm_parameter" "report-nlb" {
  name        = "/${var.environment}/tf-eks/report-nlb"
  description = "report nlb arn"
  type        = "String"
  value = module.nlb.listeners["report"].arn
  tags = {
    workshop = "tf-eks-workshop"
  }
}

resource "aws_ssm_parameter" "subscribetion-nlb" {
  name        = "/${var.environment}/tf-eks/subscription-nlb"
  description = "subscription nlb arn"
  type        = "String"
  value = module.nlb.listeners["subscription"].arn
  tags = {
    workshop = "tf-eks-workshop"
  }
}

resource "aws_ssm_parameter" "astra-nlb" {
  name        = "/${var.environment}/tf-eks/astra-nlb"
  description = "astra nlb arn"
  type        = "String"
  value = module.nlb.listeners["astra"].arn
  tags = {
    workshop = "tf-eks-workshop"
  }
}