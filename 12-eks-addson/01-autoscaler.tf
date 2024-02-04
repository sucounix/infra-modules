# resource "helm_release" "cluster_autoscaler" {
# #   count = var.enable_cluster_autoscaler ? 1 : 0

#   name = "autoscaler"

#   repository = "https://kubernetes.github.io/autoscaler"
#   chart      = "cluster-autoscaler"
#   namespace  = "kube-system"
#   version    = "9.28.0"

#   set {
#     name  = "rbac.serviceAccount.name"
#     value = "cluster-autoscaler"
#   }

#   # set {
#   #   name  = "rbac.serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
#   #   value = aws_iam_role.
#   # }

#   set {
#     name  = "autoDiscovery.clusterName"
#     value = data.aws_ssm_parameter.cluster-name.value
#   }
# }
