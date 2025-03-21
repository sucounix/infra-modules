# provider "aws" {
#   region = local.region
# }

data "aws_availability_zones" "available" {}

locals {
  # name   = "ex-${basename(path.cwd)}"
  # region = "eu-west-1"

  # vpc_cidr = "10.0.0.0/16"
  # azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    Example    = var.db-identifier
    GithubRepo = "terraform-aws-rds-aurora"
    GithubOrg  = "terraform-aws-modules"
  }
}

################################################################################
# RDS Aurora Module
################################################################################

module "aurora" {
  source = "./terraform-aws-rds-aurora"

  name            = var.db-identifier
  engine          = "aurora-postgresql"
  engine_version  = "14.7"
  master_username = "root"
  storage_type    = "aurora-iopt1"
  instances = {
    1 = {
      instance_class          = var.db-instance_class
      publicly_accessible     = var.publicly_accessible
      db_parameter_group_name = "default.aurora-postgresql14"
    }
  #   2 = {
  #     identifier     = "static-member-1"
  #     instance_class = var.db-instance_class
  #   }
  #   3 = {
  #     identifier     = "excluded-member-1"
  #     instance_class = var.db-instance_class
  #     promotion_tier = 15
  #   }
  }

  # endpoints = {
  #   static = {
  #     identifier     = "static-custom-endpt"
  #     type           = "ANY"
  #     static_members = ["static-member-1"]
  #     tags           = { Endpoint = "static-members" }
  #   }
  #   excluded = {
  #     identifier       = "excluded-custom-endpt"
  #     type             = "READER"
  #     excluded_members = ["excluded-member-1"]
  #     tags             = { Endpoint = "excluded-members" }
  #   }
  # }
  create_security_group = false
  vpc_id               = data.aws_ssm_parameter.eks-vpc.value
  db_subnet_group_name = var.db_subnet_group_name
  vpc_security_group_ids = [data.aws_ssm_parameter.db-sg.value]
  # security_group_rules = {
  #   vpc_ingress = {
  #     source_security_group_id = "sg-03e40013f47f78792"
  #   }
  # }

  apply_immediately   = true
  skip_final_snapshot = true

  create_db_cluster_parameter_group      = true
  db_cluster_parameter_group_name        = var.db-identifier
  db_cluster_parameter_group_family      = "aurora-postgresql14"
  db_cluster_parameter_group_description = "${var.db-identifier} example cluster parameter group"
  db_cluster_parameter_group_parameters = [
    {
      name         = "log_min_duration_statement"
      value        = 4000
      apply_method = "immediate"
      }, {
      name         = "rds.force_ssl"
      value        = 1
      apply_method = "immediate"
    }
  ]

  create_db_parameter_group      = true
  db_parameter_group_name        = var.db-identifier
  db_parameter_group_family      = "aurora-postgresql14"
  db_parameter_group_description = "${var.db-identifier} example DB parameter group"
  db_parameter_group_parameters = [
    {
      name         = "log_min_duration_statement"
      value        = 4000
      apply_method = "immediate"
    }
  ]

  enabled_cloudwatch_logs_exports = ["postgresql"]
  create_cloudwatch_log_group     = true

  create_db_cluster_activity_stream     = false
  db_cluster_activity_stream_kms_key_id = module.kms.key_id
  db_cluster_activity_stream_mode       = "async"

  tags = local.tags
}

################################################################################
# Supporting Resources
################################################################################

# module "vpc" {
#   source  = "terraform-aws-modules/vpc/aws"
#   version = "~> 5.0"

#   name = local.name
#   cidr = local.vpc_cidr

#   azs              = local.azs
#   public_subnets   = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k)]
#   private_subnets  = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 3)]
#   database_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 6)]

#   tags = local.tags
# }

module "kms" {
  source  = "terraform-aws-modules/kms/aws"
  version = "~> 2.0"

  deletion_window_in_days = 7
  description             = "KMS key for ${var.db-identifier} cluster activity stream."
  enable_key_rotation     = true
  is_enabled              = true
  key_usage               = "ENCRYPT_DECRYPT"

  aliases = [var.db-identifier]

  tags = local.tags
}
