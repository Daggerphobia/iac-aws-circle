output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr" {
  value = module.vpc.vpc_cidr
}

output "vpc_default_sg_id" {
  value = module.vpc.vpc_default_sg_id
}

output "igw_id" {
  value = module.igw.igw_id
}

output "priv-subnets" {
  value = module.subnet.priv-subnets
}

output "public-subnets" {
  value = module.subnet.public-subnets
}

output "natgw_ip" {
  value = module.natgw.natgw_ip
}

output "priv_route_table_id" {
 value = module.route-tables.priv_route_table_id
}

output "pub_route_table_id" {
 value = module.route-tables.pub_route_table_id
}