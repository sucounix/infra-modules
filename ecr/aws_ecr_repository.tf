resource "aws_ecr_repository" "analysis" {
  name                 = format("%s-analysis-repo",data.aws_ssm_parameter.environment.value)
  image_tag_mutability = "IMMUTABLE"
  force_delete         = false
  image_scanning_configuration {
    scan_on_push = true
  }
  # encryption_configuration {
  #   encryption_type = "KMS"
  #   kms_key         = data.aws_ssm_parameter.tf-eks-keyid.value
  # }
}

resource "aws_ecr_repository" "report" {
  name                 = format("%s-report-repo",data.aws_ssm_parameter.environment.value)
  image_tag_mutability = "IMMUTABLE"
  force_delete         = true
  image_scanning_configuration {
    scan_on_push = true
  }
  # encryption_configuration {
  #   encryption_type = "KMS"
  #   kms_key         = data.aws_ssm_parameter.tf-eks-keyid.value
  # }
}

resource "aws_ecr_repository" "subscription" {
  name                 = format("%s-subscription-repo",data.aws_ssm_parameter.environment.value)
  image_tag_mutability = "IMMUTABLE"
  force_delete         = true
  image_scanning_configuration {
    scan_on_push = true
  }
  # encryption_configuration {
  #   encryption_type = "KMS"
  #   kms_key         = data.aws_ssm_parameter.tf-eks-keyid.value
  # }
}

resource "aws_ecr_repository" "charts" {
  name                 = format("%s-charts-repo",data.aws_ssm_parameter.environment.value)
  image_tag_mutability = "IMMUTABLE"
  force_delete         = true
  image_scanning_configuration {
    scan_on_push = true
  }
  # encryption_configuration {
  #   encryption_type = "KMS"
  #   kms_key         = data.aws_ssm_parameter.tf-eks-keyid.value
  # }
}

resource "aws_ecr_repository" "astra" {
  name                 = format("%s-astra-repo",var.environment)
  image_tag_mutability = "IMMUTABLE"
  force_delete         = true
  image_scanning_configuration {
    scan_on_push = true
  }
  # encryption_configuration {
  #   encryption_type = "KMS"
  #   kms_key         = data.aws_ssm_parameter.tf-eks-keyid.value
  # }
}

resource "aws_ecr_repository" "fe" {
  name                 = format("%s-fe-repo",data.aws_ssm_parameter.environment.value)
  image_tag_mutability = "IMMUTABLE"
  force_delete         = true
  image_scanning_configuration {
    scan_on_push = true
  }
  # encryption_configuration {
  #   encryption_type = "KMS"
  #   kms_key         = data.aws_ssm_parameter.tf-eks-keyid.value
  # }
}