resource "aws_route_table" "pub_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gw
  }

  tags = merge(
    var.common_tags,
    map(
      "Name", format("%s-RT", var.pub_name),
    )
  )
}

resource "aws_route_table_association" "public_rt_association" {
  count          = length(var.pub_subnets)
  subnet_id      = element(var.pub_subnets, count.index)
  route_table_id = aws_route_table.pub_rt.id
}

output "pub_route_table_id" {
  value = aws_route_table.pub_rt.id
}