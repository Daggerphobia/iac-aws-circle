data "aws_availability_zones" "available" {}
data "aws_caller_identity" "current" {}

# variable "environment" {
# }
variable "area" {
  default = "iac"
}

variable "account_type" {}

variable "cidr_block" {}

variable "private_subnets" {
  type = list
}
variable "public_subnets" {
  type = list
}

# variable "dns_resolver" {
#   default = "192.168.0.2"
# }

variable "region" {}

variable "zones" {
  type = list
}

# variable "natgw_public_subnet_id" {
#   type = list
#   default = ""
# }


# Required tag variables
variable "tag_Responsible" {
  description = "Dogukan"
  default = "Dogukan"
}
variable "tag_Service" {
  description = "Application Name"
  default = "ScaffoldingIaC"
}


locals {
  common_tags = {
    Responsible               = var.tag_Responsible
    Service                   = var.tag_Service
  }
}