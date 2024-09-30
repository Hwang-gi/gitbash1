resource "aws_internet_gateway" "PRD-IGW" {
  vpc_id = aws_vpc.PRD-VPC.id
  tags = {
    "Name" = "PRD-IGW"
  }

}

resource "aws_internet_gateway" "DEV-IGW" {
  vpc_id = aws_vpc.DEV-VPC.id
  tags = {
    "Name" = "DEV-IGW"
  }

}
