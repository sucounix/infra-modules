
variable "db-identifier" {
    type = string
    description = "(optional) describe your variable"
    default = "devdb"
}
variable "db_name" {
    type = string
    description = "(optional) describe your variable"
    default = "app1_db"
}

variable "db-instance_class" {
    type = string
    description = "(optional) describe your variable"
    default = "db.t3.medium"
}

variable "username" {
    type = string
    description = "(optional) describe your variable"
    default = "postgres"
}

variable "password" {
    type = string
    description = "(optional) describe your variable"
    default = "postgres"
}

variable "db_subnet_group_name" {
    type = string
    description = "(optional) describe your variable"
    default = "db_subnets"
}

variable "vpc_security_group_ids" {
    type = list
    description = "(optional) describe your variable"
    default = ["sg-03e40013f47f78792"]
}

variable "publicly_accessible" {
    type = bool
    description = "(optional) describe your variable"
    default = false
}

variable "vpc_id" {
    type = string
    description = "(optional) describe your variable"
    default = "vpc-0795714250020a669"
}

variable "vpc_cidr_block" {
    type = string
    description = "(optional) describe your variable"
    default = "0.0.0.0/0"
}