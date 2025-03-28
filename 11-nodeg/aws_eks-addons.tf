resource "aws_eks_addon" "kube-proxy" {
  depends_on     = [aws_eks_node_group.ng1]
  cluster_name  = data.aws_ssm_parameter.tf-eks-cluster-name.value
  addon_name    = "kube-proxy"
  addon_version = "v1.28.1-eksbuild.1"
  resolve_conflicts = "OVERWRITE"
}

resource "aws_eks_addon" "coredns" {
  depends_on           = [aws_eks_node_group.ng1]
  cluster_name         = data.aws_ssm_parameter.tf-eks-cluster-name.value
  addon_name           = "coredns"
  configuration_values = "{\"replicaCount\":2,\"resources\":{\"limits\":{\"cpu\":\"100m\",\"memory\":\"150Mi\"},\"requests\":{\"cpu\":\"100m\",\"memory\":\"150Mi\"}}}"
  addon_version        = "v1.10.1-eksbuild.2"
  resolve_conflicts = "OVERWRITE"
}

resource "aws_eks_addon" "ebs-csi-driver" {
  depends_on     = [aws_eks_node_group.ng1]
  cluster_name  = data.aws_ssm_parameter.tf-eks-cluster-name.value
  addon_name    = "aws-ebs-csi-driver"
  addon_version = "v1.26.1-eksbuild.1"
  resolve_conflicts = "OVERWRITE"
}