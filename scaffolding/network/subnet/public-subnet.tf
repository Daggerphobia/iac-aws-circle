#--------------------------------------------------------------
# This module creates following resources:
#     Public subnet(s) with different availability zones
#     Route table(s) for Public subnet in different availability zones
#     Attach Internet Gateway to Route table(s)
#     Associate Public subnet(s) with its Route table
#--------------------------------------------------------------

resource "aws_subnet" "pub_subnet" {
  vpc_id            = var.vpc_id
  count             = length(var.public_subnets)
  cidr_block        = element(var.public_subnets, count.index)
  availability_zone = element(var.zones, count.index)

  tags = merge(
    var.common_tags,
    map(
      "Name", format("%s-Subnet-%s", var.pub_name, count.index),
    )
  )
}

output "public-subnets" {
  value = aws_subnet.pub_subnet.*.id
}