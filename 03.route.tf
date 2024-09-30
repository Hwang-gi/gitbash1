resource "aws_route" "PRD-RT-PUB" {
  route_table_id         = aws_route_table.PRD-RT-PUB.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.PRD-IGW.id


}

resource "aws_route" "PRD-RT-PRI-01" {
  route_table_id         = aws_route_table.PRD-RT-PRI-01.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.PRD-NGW-01.id
}

resource "aws_route" "PRD-RT-PRI-02" {
  route_table_id         = aws_route_table.PRD-RT-PRI-02.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.PRD-NGW-02.id
}
/*
resource "aws_route" "DEV-RT-PUB" {
  route_table_id         = aws_route_table.DEV-RT-PUB.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.DEV-IGW.id

}

resource "aws_route" "DEV-RT-PRI-01" {
  route_table_id         = aws_route_table.DEV-RT-PRI-01.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.DEV-NGW-01.id
}

resource "aws_route" "DEV-RT-PRI-02" {
  route_table_id         = aws_route_table.DEV-RT-PRI-02.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.DEV-NGW-02.id
}
*/
