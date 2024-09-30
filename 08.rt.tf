resource "aws_route_table" "PRD-RT-PUB" {
  vpc_id = aws_vpc.PRD-VPC.id

  tags = {
    "Name" = "PRD-RT-PUB"
  }

}

resource "aws_route_table" "PRD-RT-PRI-01" {
  vpc_id = aws_vpc.PRD-VPC.id
  tags = {
    "Name" = "PRD-RT-PRI-01"
  }
}

resource "aws_route_table" "PRD-RT-PRI-02" {
  vpc_id = aws_vpc.PRD-VPC.id

  tags = {
    "Name" = "PRD-RT-PRI-02"
  }

}
/*
resource "aws_route_table" "DEV-RT-PUB" {
  vpc_id = aws_vpc.DEV-VPC.id

  tags = {
    "Name" = "DEV-RT-PUB"
  }

}

resource "aws_route_table" "DEV-RT-PRI-01" {
  vpc_id = aws_vpc.DEV-VPC.id
  tags = {
    "Name" = "DEV-RT-PRI-01"
  }
}

resource "aws_route_table" "DEV-RT-PRI-02" {
  vpc_id = aws_vpc.DEV-VPC.id
  tags = {
    "Name" = "DEV-RT-PRI-02"
  }

}
*/
