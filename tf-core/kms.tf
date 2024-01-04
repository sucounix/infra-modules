resource "aws_kms_key" "ekskey" {
  description = format("%s EKS KMS Key 2 %s", var.environment, var.cluster-name)
}

output "keyid" {
  value = aws_kms_key.ekskey.key_id
}