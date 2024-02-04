data "aws_ssm_parameter" "eks-vpc" {
  name        = "/${var.environment}/tf-eks/eks-vpc"
}

data "aws_ssm_parameter" "eks-cidr" {
  name        = "/${var.environment}/tf-eks/eks-cidr"
}

data "aws_ssm_parameter" "sub-isol1" {
  name        = "/${var.environment}/tf-eks/sub-isol1"
}

data "aws_ssm_parameter" "sub-isol2" {
  name        = "/${var.environment}/tf-eks/sub-isol2"
}

data "aws_ssm_parameter" "sub-isol3" {
  name        = "/${var.environment}/tf-eks/sub-isol3"
}

data "aws_ssm_parameter" "sub-p1" {
  name        = "/${var.environment}/tf-eks/sub-p1"
}

data "aws_ssm_parameter" "sub-priv1" {
  name        = "/${var.environment}/tf-eks/sub-priv1"
}

data "aws_ssm_parameter" "sub-priv2" {
  name        = "/${var.environment}/tf-eks/sub-priv2"
}

data "aws_ssm_parameter" "sub-priv3" {
  name        = "/${var.environment}/tf-eks/sub-priv3"
}

# data "aws_ssm_parameter" "cicd-vpc" {
#   name        = "/${var.environment}/tf-eks/cicd-vpc"
# }

# data "aws_ssm_parameter" "cicd-cidr" {
#   name        = "/${var.environment}/tf-eks/cicd-cidr"
# }


data "aws_ssm_parameter" "net-cluster-sg" {
  name        = "/${var.environment}/tf-eks/net-cluster-sg"
}

data "aws_ssm_parameter" "allnodes-sg" {
  name        = "/${var.environment}/tf-eks/allnodes-sg"
}


data "aws_ssm_parameter" "rtb-isol" {
  name        = "/${var.environment}/tf-eks/rtb-isol"
}

data "aws_ssm_parameter" "rtb-priv1" {
  name        = "/${var.environment}/tf-eks/rtb-priv1"
}


data "aws_ssm_parameter" "rtb-priv2" {
  name        = "/${var.environment}/tf-eks/rtb-priv2"
}


data "aws_ssm_parameter" "rtb-priv3" {
  name        = "/${var.environment}/tf-eks/rtb-priv3"
}







