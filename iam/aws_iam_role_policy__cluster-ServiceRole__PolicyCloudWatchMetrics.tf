# File generated by aws2tf see https://github.com/aws-samples/aws2tf
resource "aws_iam_role_policy" "eks-cluster-ServiceRole__eks-cluster-PolicyCloudWatchMetrics" {
  name = format("%s-%s-eks-cluster-PolicyCloudWatchMetrics",data.aws_ssm_parameter.environment.value,data.aws_ssm_parameter.tf-eks-id.value)
  policy = jsonencode(
    {
      Statement = [
        {
          Action = [
            "cloudwatch:PutMetricData",
          ]
          Effect   = "Allow"
          Resource = "*"
        },
      ]
      Version = "2012-10-17"
    }
  )
  role = aws_iam_role.eks-cluster-ServiceRole.id
}
