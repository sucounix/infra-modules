# resource "kubernetes_service_account" "aws-load-balancer-controller" {
#   automount_service_account_token = true
#   metadata {
#     name      = "aws-load-balancer-controller"
#     namespace = "kube-system"
#     labels = {
#       "app.kubernetes.io/component" = "controller"
#       "app.kubernetes.io/name"      = "aws-load-balancer-controller"
#     }
#     # annotations = {
#     #   "eks.amazonaws.com/role-arn" = aws_iam_role.AmazonEKSLoadBalancerControllerRole.arn
#     # }
#   }
# #   depends_on = [
# #     aws_iam_role_policy_attachment.AWSLoadBalancerControllerIAMPolicyRoleAttachment
# #   ]
# }

resource "helm_release" "aws-load-balancer-controller" {
  name       = "aws-load-balancer-controller"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  version    = "1.6.2"

  namespace = "kube-system"

  set {
    name  = "image.repository"
    value = "public.ecr.aws/eks/aws-load-balancer-controller"
  }

  set {
    name  = "clusterName"
    value = data.aws_ssm_parameter.cluster-name.value
  }

  set {
    name  = "serviceAccount.create"
    value = "true"
  }

  set {
    name  = "serviceAccount.name"
    value = "aws-load-balancer-controller"
  }

  set {
    name  = "replicaCount"
    value = "1"
  }

#   depends_on = [
#     kubernetes_service_account.aws-load-balancer-controller
#   ]
}


# helm install aws-load-balancer-controller eks/aws-load-balancer-controller -n kube-system --set clusterName=dev-eks-cluster --set serviceAccount.create=true --set serviceAccount.name=aws-load-balancer-controller
# https://aws.github.io/eks-charts