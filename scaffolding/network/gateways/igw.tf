#--------------------------------------------------------------
# This module creates all resources necessary for a Gateway
#--------------------------------------------------------------

variable "vpc_id" {}
variable "name" {}

variable "common_tags" {
  type = map
}

resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = merge(
    var.common_tags,
    map(
      "Name", var.name,
    )
  )
}

output "igw_id" {
  value = aws_internet_gateway.igw.id
}
