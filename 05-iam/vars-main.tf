# TF_VAR_region
variable "region" {
  description = "The name of the AWS Region"
  type        = string
  default     = "eu-west-1"
}

variable "profile" {
  description = "The name of the AWS profile in the credentials file"
  type        = string
  default     = "default"
}

variable "environment" {
  type        = string
  description = "(optional) describe your variable"
  default     = "test"
}

variable "cluster-name" {
  description = "The name of the EKS Cluster"
  type        = string
  default     = "mycluster1"
}


variable "eks_version" {
  type    = string
  default = "1.28"
}

variable "no-output" {
  description = "The name of the EKS Cluster"
  type        = string
  default     = "secret"
  sensitive   = true
}


