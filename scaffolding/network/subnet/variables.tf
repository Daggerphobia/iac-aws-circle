variable "vpc_id" {}

variable "zones" {
  type = list
}

variable "private_subnets" {
  type = list
}
variable "public_subnets" {
  type = list
}

variable "priv_name" {}
# variable "priv_subnet_start" {}

variable "pub_name" {}
# variable "pub_subnet_start" {}

variable "common_tags" {
  type = map
}
