#--------------------------------------------------------------
# This module creates following resources:
#     Private subnet(s) with different availability zones
#     Route table(s) for Private subnet(s) in different availability zones
#     Associate Private subnet(s) with its Route table
#--------------------------------------------------------------

resource "aws_subnet" "priv_subnet" {
  vpc_id            = var.vpc_id
  count             = length(var.private_subnets)
  cidr_block        = element(var.private_subnets, count.index)
  availability_zone = element(var.zones, count.index)

  tags = merge(
    var.common_tags,
    map(
      "Name", format("%s-Subnet-%s", var.priv_name, count.index),
    )
  )
}

output "priv-subnets" {
  value = aws_subnet.priv_subnet.*.id
}
