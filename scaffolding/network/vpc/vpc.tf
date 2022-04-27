#--------------------------------------------------------------
# This module creates all resources necessary for a VPC
#--------------------------------------------------------------

variable "name" {
  default = "vpc"
}
variable "common_tags" {
  type = map
}

variable "cidr" {}

resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    var.common_tags,
    map(
      "Name", var.name,
    )
  )
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "vpc_cidr" {
  value = aws_vpc.vpc.cidr_block
}

output "vpc_default_sg_id" {
  value = aws_vpc.vpc.default_security_group_id
}
