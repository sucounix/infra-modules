# provider "aws" {
#   region = local.region
# }

# data "aws_availability_zones" "available" {}

locals {
#   region = "eu-west-1"
#   name   = "ex-${basename(path.cwd)}"

#   vpc_cidr = "10.0.0.0/16"
#   azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    Name       = var.name
    Example    = var.name
    Repository = "https://github.com/terraform-aws-modules/terraform-aws-alb"
  }
}

##################################################################
# Network Load Balancer
##################################################################

module "nlb" {
  source = "./terraform-aws-alb"

  name = var.name

  load_balancer_type               = "network"
  internal                         = true
  vpc_id                           = data.aws_ssm_parameter.eks-vpc.value
  dns_record_client_routing_policy = "any_availability_zone"

  # https://github.com/hashicorp/terraform-provider-aws/issues/17281
  # subnets = module.vpc.private_subnets

  # Use `subnet_mapping` to attach EIPs
  # subnet_mapping = [for i, eip in aws_eip.this :
  #   {
  #     allocation_id = eip.id
  #     subnet_id     = module.vpc.private_subnets[i]
  #   }
  # ]

  subnets = [data.aws_ssm_parameter.sub-priv1.value, data.aws_ssm_parameter.sub-priv2.value, data.aws_ssm_parameter.sub-priv3.value]


  # For example only
  enable_deletion_protection = false

  # Security Group
  enforce_security_group_inbound_rules_on_private_link_traffic = "off"
  security_group_ingress_rules = {
    all_tcp = {
      from_port   = 8081
      to_port     = 8089
      ip_protocol = "tcp"
      description = "TCP traffic"
      cidr_ipv4   = "0.0.0.0/0"
    }
    all_udp = {
      from_port   = 8081
      to_port     = 8089
      ip_protocol = "udp"
      description = "UDP traffic"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }
  security_group_egress_rules = {
    all = {
      ip_protocol = "-1"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }

  # access_logs = {
  #   bucket = module.log_bucket.s3_bucket_id
  # }

  listeners = {
    analysis = {
      port     = 8081
      protocol = "TCP"
      forward = {
        target_group_key = "tg-analysis"
      }
    }
    report = {
      port     = 8082
      protocol = "TCP"
      forward = {
        target_group_key = "tg-report"
      }
    }
    subscription = {
      port     = 8084
      protocol = "TCP"
      forward = {
        target_group_key = "tg-subscription"
      }
    }
    astra = {
      port     = 8085
      protocol = "TCP"
      forward = {
        target_group_key = "tg-astra"
      }
    }
    # ex-two = {
    #   port     = 82
    #   protocol = "UDP"
    #   forward = {
    #     target_group_key = "ex-target-two"
    #   }
    # }

    # ex-three = {
    #   port     = 83
    #   protocol = "TCP"
    #   forward = {
    #     target_group_key = "ex-target-three"
    #   }
    # }

    # ex-four = {
    #   port            = 84
    #   protocol        = "TLS"
    #   certificate_arn = module.acm.acm_certificate_arn
    #   forward = {
    #     target_group_key = "ex-target-four"
    #   }
    # }
  }

  target_groups = {
  # #   ex-target-one = {
  # #     name_prefix            = "t1-"
  # #     protocol               = "TCP_UDP"
  # #     port                   = 81
  # #     target_type            = "instance"
  # #     # target_id              = aws_instance.this.id
  # #     connection_termination = true
  # #     preserve_client_ip     = true

  # #     stickiness = {
  # #       type = "source_ip"
  # #     }

  # #     tags = {
  # #       tcp_udp = true
  # #     }
  # #   }

  #   # ex-target-two = {
  #   #   name_prefix = "t2-"
  #   #   protocol    = "UDP"
  #   #   port        = 82
  #   #   target_type = "instance"
  #   #   target_id   = aws_instance.this.id
  #   # }

    tg-analysis = {
      name          = format("%s-analysis", var.environment)
      protocol             = "TCP"
      port                 = 80
      target_type          = "ip"
      # target_id            = aws_instance.this.private_ip
      deregistration_delay = 10
      # health_check = {
      #   enabled             = true
      #   interval            = 30
      #   path                = "/healthz"
      #   port                = "traffic-port"
      #   healthy_threshold   = 3
      #   unhealthy_threshold = 3
      #   timeout             = 6
      # }
    }
    tg-report = {
      name          = format("%s-report", var.environment)
      protocol             = "TCP"
      port                 = 80
      target_type          = "ip"
      # target_id            = aws_instance.this.private_ip
      deregistration_delay = 10
      # health_check = {
      #   enabled             = true
      #   interval            = 30
      #   path                = "/healthz"
      #   port                = "traffic-port"
      #   healthy_threshold   = 3
      #   unhealthy_threshold = 3
      #   timeout             = 6
      # }
    }
    tg-subscription = {
      name          = format("%s-subscription", var.environment)
      protocol             = "TCP"
      port                 = 80
      target_type          = "ip"
      # target_id            = aws_instance.this.private_ip
      deregistration_delay = 10
      # health_check = {
      #   enabled             = true
      #   interval            = 30
      #   path                = "/healthz"
      #   port                = "traffic-port"
      #   healthy_threshold   = 3
      #   unhealthy_threshold = 3
      #   timeout             = 6
      # }
    }
    tg-astra = {
      name          = format("%s-astra", var.environment)
      protocol             = "TCP"
      port                 = 80
      target_type          = "ip"
      # target_id            = aws_instance.this.private_ip
      deregistration_delay = 10
      # health_check = {
      #   enabled             = true
      #   interval            = 30
      #   path                = "/healthz"
      #   port                = "traffic-port"
      #   healthy_threshold   = 3
      #   unhealthy_threshold = 3
      #   timeout             = 6
      # }
    }
  #   # ex-target-four = {
  #   #   name_prefix = "t4-"
  #   #   protocol    = "TLS"
  #   #   port        = 84
  #   #   target_type = "instance"
  #   #   target_id   = aws_instance.this.id
  #   #   target_health_state = {
  #   #     enable_unhealthy_connection_termination = false
  #   #   }
    # }
  }

  tags = local.tags
}

################################################################################
# Supporting resources
################################################################################

# module "vpc" {
#   source  = "terraform-aws-modules/vpc/aws"
#   version = "~> 5.0"

#   name = var.name
#   cidr = local.vpc_cidr

#   azs             = local.azs
#   private_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 4, k)]
#   public_subnets  = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 48)]

#   tags = local.tags
# }

# data "aws_route53_zone" "this" {
#   name = var.domain_name
# }

# module "acm" {
#   source  = "terraform-aws-modules/acm/aws"
#   version = "~> 4.0"

#   domain_name = var.domain_name
#   zone_id     = data.aws_route53_zone.this.id
# }

# resource "aws_eip" "this" {
#   count = length(local.azs)

#   domain = "vpc"
# }

# data "aws_ssm_parameter" "al2" {
#   name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
# }

# resource "aws_instance" "this" {
#   ami           = data.aws_ssm_parameter.al2.value
#   instance_type = "t3.nano"
#   subnet_id     = element(module.vpc.private_subnets, 0)
# }

# module "log_bucket" {
#   source  = "terraform-aws-modules/s3-bucket/aws"
#   version = "~> 3.0"

#   bucket_prefix = "${var.name}-logs-"
#   acl           = "log-delivery-write"

#   # For example only
#   force_destroy = true

#   control_object_ownership = true
#   object_ownership         = "ObjectWriter"

#   attach_elb_log_delivery_policy = true # Required for ALB logs
#   attach_lb_log_delivery_policy  = true # Required for ALB/NLB logs

#   attach_deny_insecure_transport_policy = true
#   attach_require_latest_tls_policy      = true

#   tags = local.tags
# }
