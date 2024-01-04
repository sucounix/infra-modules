variable "table_name_vpc" {
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  type        = string
  default     = "terraform_locks_vpc"
}

variable "table_name_iam" {
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  type        = string
  default     = "terraform_locks_iam"
}

# variable "table_name_c9net" {
#   description = "The name of the DynamoDB table. Must be unique in this AWS account."
#   type        = string
#   default     = "terraform_locks_c9net"
# }

# variable "table_name_cicd" {
#   description = "The name of the DynamoDB table. Must be unique in this AWS account."
#   type        = string
#   default     = "terraform_locks_cicd"
# }

variable "table_name_cluster" {
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  type        = string
  default     = "terraform_locks_cluster"
}

variable "table_name_nodeg" {
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  type        = string
  default     = "terraform_locks_nodeg"
}

# variable "table_name_fargate" {
#   description = "The name of the DynamoDB table. Must be unique in this AWS account."
#   type        = string
#   default     = "terraform_locks_fargate"
# }

# variable "table_name_sampleapp" {
#   description = "The name of the DynamoDB table. Must be unique in this AWS account."
#   type        = string
#   default     = "terraform_locks_sampleapp"
# }

variable "table_name_tf-setup" {
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  type        = string
  default     = "terraform_locks_tf-core"
}

variable "stages" {
  type    = list(string)
  default = ["tf-core", "vpc", "cluster", "nodeg"]
}

variable "stagecount" {
  type    = number
  default = 4
}
