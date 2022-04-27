variable "vpc_id" {}
variable "name" {}
variable "public_subnet_id" {
  type = list
}

variable "common_tags" {
  type = map
}
