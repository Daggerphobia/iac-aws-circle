# This module creates all resources necessary for a Gateway (igw)

## igw.tf
### input
* variable "name"   { default = "public" }
* variable "vpc_id" { }
* variable "cidrs"  { }
* variable "azs"    { }
* variable "default_gateway" { }


### output
* output "subnet_ids" { value = "${join(",", aws_subnet.public.*.id)}" }
* output "routing_table_id" {value = ""}
