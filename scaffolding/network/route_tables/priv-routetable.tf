resource "aws_route_table" "priv_rt" {
  count  = length(var.nat_gw)
  vpc_id = var.vpc_id

  tags = merge(
    var.common_tags,
    map(
      "Name", format("%s-RT-%s", var.priv_name, count.index),
    )
  )
}

resource "aws_route" "priv_rt_route_entry_natgw" {
  count                     = length(var.nat_gw)
  route_table_id            = aws_route_table.priv_rt[count.index].id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id            = element(var.nat_gw, count.index)
}

resource "aws_route_table_association" "priv_rt_association" {
  count          = length(var.priv_subnets)
  subnet_id      = element(var.priv_subnets, count.index)
  route_table_id = aws_route_table.priv_rt[count.index].id
}

output "priv_route_table_id" {
  value = aws_route_table.priv_rt.*.id
}
