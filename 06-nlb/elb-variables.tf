variable "domain_name" {
  description = "The domain name for which the certificate should be issued"
  type        = string
  default     = "terraform-aws-modules.modules.tf"
}

variable "name" {
  type = string
  description = "(optional) describe your variable"
  default = "dev-be-nlb"
}

variable "subnet_ids" {
  type = list
  description = "(optional) describe your variable"
  default = []
}