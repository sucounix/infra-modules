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


variable "subnet-db1" {
  type        = string
  description = "(optional) describe your variable"
  default     = "10.0.48.0/21"
}

variable "subnet-db2" {
  type        = string
  description = "(optional) describe your variable"
  default     = "10.0.56.0/21"
}

variable "subnet-db3" {
  type        = string
  description = "(optional) describe your variable"
  default     = "10.0.64.0/21"
}

# [
#   {
#     "subnet": 1,
#     "networkAddress": "10.0.0.0/21",
#     "usableIPRange": "10.0.0.1 - 10.0.7.254",
#     "broadcastAddress": "10.0.7.255"
#   },
#   {
#     "subnet": 2,
#     "networkAddress": "10.0.8.0/21",
#     "usableIPRange": "10.0.8.1 - 10.0.15.254",
#     "broadcastAddress": "10.0.15.255"
#   },
#   {
#     "subnet": 3,
#     "networkAddress": "10.0.16.0/21",
#     "usableIPRange": "10.0.16.1 - 10.0.23.254",
#     "broadcastAddress": "10.0.23.255"
#   },
#   {
#     "subnet": 4,
#     "networkAddress": "10.0.24.0/21",
#     "usableIPRange": "10.0.24.1 - 10.0.31.254",
#     "broadcastAddress": "10.0.31.255"
#   },
#   {
#     "subnet": 5,
#     "networkAddress": "10.0.32.0/21",
#     "usableIPRange": "10.0.32.1 - 10.0.39.254",
#     "broadcastAddress": "10.0.39.255"
#   },
#   {
#     "subnet": 6,
#     "networkAddress": "10.0.40.0/21",
#     "usableIPRange": "10.0.40.1 - 10.0.47.254",
#     "broadcastAddress": "10.0.47.255"
#   },
#   {
#     "subnet": 7,
#     "networkAddress": "10.0.48.0/21",
#     "usableIPRange": "10.0.48.1 - 10.0.55.254",
#     "broadcastAddress": "10.0.55.255"
#   },
#   {
#     "subnet": 8,
#     "networkAddress": "10.0.56.0/21",
#     "usableIPRange": "10.0.56.1 - 10.0.63.254",
#     "broadcastAddress": "10.0.63.255"
#   },
#   {
#     "subnet": 9,
#     "networkAddress": "10.0.64.0/21",
#     "usableIPRange": "10.0.64.1 - 10.0.71.254",
#     "broadcastAddress": "10.0.71.255"
#   }
# ]
