# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_iam_role_policy_attachment.eks-nodegroup-ng-ma-NodeInstanceRole-1GFKA1037E1XO__AmazonEC2ContainerRegistryReadOnly:
resource "aws_iam_role_policy_attachment" "eks-nodegroup-ng-ma-NodeInstanceRole__AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks-nodegroup-ng-ma-NodeInstanceRole.id
}
