#--------------------------------------------------------------
# This module creates all resources necessary for a Nat Gateway
#--------------------------------------------------------------

resource "aws_eip" "nat" {
  count = length(var.public_subnet_id)
  vpc   = true
  tags  = merge(
    var.common_tags,
    map(
      "Name", format("%s-EIP-NAT-%s", var.name, count.index),
    )
  )
}

resource "aws_nat_gateway" "nat" {
  count         = length(var.public_subnet_id)
  allocation_id = element(aws_eip.nat.*.id, count.index)
  subnet_id     = element(var.public_subnet_id, count.index)
  tags = merge(
    var.common_tags,
    map(
      "Name", format("%s-NatGW-%s", var.name, count.index),
    )
  )
}

output "natgw_id" {
  value = aws_nat_gateway.nat.*.id
}

output "natgw_ip" {
  value = aws_nat_gateway.nat.*.public_ip
}
