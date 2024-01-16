variable "region" {
    type = string
    default = "eu-west-1"
}

variable "availability_zone" {
    type = string
    default = "eu-west-1a"
}

# Ubuntu
# variable "instance_type" {
#     type = string
#     default = "t4g.small"
# }

# Amazon Linux 2
variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "root_volume_size" {
    type = string
    default = "10"
}