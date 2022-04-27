variable "vpc_id" {}
variable "internet_gw" {}
variable "nat_gw" {
  type = list
}

variable "zones" {
  type = list
}

variable "priv_name" {}
variable "priv_subnets" {
  type = list
}

variable "pub_name" {}
variable "pub_subnets" {
  type = list
}

variable "common_tags" {
  type = map
}
