# TF_VAR_region


variable "vpc-cidr-cluster" {
  description = "The name of the AWS profile in the credentials file"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc-cidr-assoc" {
  description = "The name of the AWS Region"
  type        = string
  default     = "100.64.0.0/16"
}



variable "subnet-i1" {
  type        = string
  description = "(optional) describe your variable"
  default     = "100.64.0.0/18"
}


variable "subnet-i2" {
  type        = string
  description = "(optional) describe your variable"
  default     = "100.64.64.0/18"
}


variable "subnet-i3" {
  type        = string
  description = "(optional) describe your variable"
  default     = "100.64.128.0/18"
}


variable "subnet-pub1" {
  type        = string
  description = "(optional) describe your variable"
  default     = "10.0.0.0/21"
}

variable "subnet-pub2" {
  type        = string
  description = "(optional) describe your variable"
  default     = "10.0.8.0/21"
}

variable "subnet-pub3" {
  type        = string
  description = "(optional) describe your variable"
  default     = "10.0.16.0/21"
}

variable "subnet-priv1" {
  type        = string
  description = "(optional) describe your variable"
  default     = "10.0.24.0/21"
}

variable "subnet-priv2" {
  type        = string
  description = "(optional) describe your variable"
  default     = "10.0.32.0/21"
}

variable "subnet-priv3" {
  type        = string
  description = "(optional) describe your variable"
  default     = "10.0.40.0/21"
}


# VPC Allocation:
# Dev VPC: 10.0.0.0/16
# Staging VPC: 10.1.0.0/16
# Prod VPC: 10.2.0.0/16
# Subnet Allocation:
# Dev VPC:

# Subnet 1: 10.0.0.0/17 (Addresses: 10.0.0.1 - 10.0.127.254)
# Subnet 2: 10.0.128.0/17 (Addresses: 10.0.128.1 - 10.0.255.254)
# Subnet 3: 10.0.256.0/17 (Addresses: 10.0.256.1 - 10.0.383.254)
# Subnet 4: 10.0.384.0/17 (Addresses: 10.0.384.1 - 10.0.511.254)
# Subnet 5: 10.0.512.0/17 (Addresses: 10.0.512.1 - 10.0.639.254)
# Subnet 6: 10.0.640.0/17 (Addresses: 10.0.640.1 - 10.0.767.254)
# Staging VPC:

# Subnet 1: 10.1.0.0/17 (Addresses: 10.1.0.1 - 10.1.127.254)
# Subnet 2: 10.1.128.0/17 (Addresses: 10.1.128.1 - 10.1.255.254)
# Subnet 3: 10.1.256.0/17 (Addresses: 10.1.256.1 - 10.1.383.254)
# Subnet 4: 10.1.384.0/17 (Addresses: 10.1.384.1 - 10.1.511.254)
# Subnet 5: 10.1.512.0/17 (Addresses: 10.1.512.1 - 10.1.639.254)
# Subnet 6: 10.1.640.0/17 (Addresses: 10.1.640.1 - 10.1.767.254)
# Prod VPC:

# Subnet 1: 10.2.0.0/17 (Addresses: 10.2.0.1 - 10.2.127.254)
# Subnet 2: 10.2.128.0/17 (Addresses: 10.2.128.1 - 10.2.255.254)
# Subnet 3: 10.2.256.0/17 (Addresses: 10.2.256.1 - 10.2.383.254)
# Subnet 4: 10.2.384.0/17 (Addresses: 10.2.384.1 - 10.2.511.254)
# Subnet 5: 10.2.512.0/17 (Addresses: 10.2.512.1 - 10.2.639.254)
# Subnet 6: 10.2.640.0/17 (Addresses: 10.2.640.1 - 10.2.767.254)