# data "aws_eks_cluster_auth" "eks" {
#     name = var.cluster-name
# }


# # provider "helm" {
# #   kubernetes {
# #     host                   = data.aws_eks_cluster.eks_cluster.endpoint
# #     cluster_ca_certificate = base64decode(data.aws_ssm_parameter.ca.value)
# #     token                  = data.aws_eks_cluster_auth.eks.token
# #   }
# # }

# # Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# # SPDX-License-Identifier: Apache-2.0
# # provider "helm" {
# #  kubernetes {
# #    host                   = data.aws_eks_cluster.eks_cluster.endpoint
# #    cluster_ca_certificate = base64decode(data.aws_ssm_parameter.ca.value)
# #    exec {
# #      api_version = "client.authentication.k8s.io/v1beta1"
# #      args        = ["eks", "get-token", "--cluster-name", var.cluster-name]
# #      command     = "aws"
# #    }
# #  }
# # }

# provider "helm" {
#   kubernetes {
#     config_path = "~/.kube/config"
#   }
# }


provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks_cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_ssm_parameter.ca.value)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    # This requires the awscli to be installed locally where Terraform is executed
    args = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.eks_cluster.name]
  }
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.eks_cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_ssm_parameter.ca.value)

    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      # This requires the awscli to be installed locally where Terraform is executed
      args = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.eks_cluster.name]
    }
  }
}

provider "kubectl" {
  apply_retry_count      = 5
  host                   = data.aws_eks_cluster.eks_cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_ssm_parameter.ca.value)
  load_config_file       = false

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    # This requires the awscli to be installed locally where Terraform is executed
    args = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.eks_cluster.name]
  }
}