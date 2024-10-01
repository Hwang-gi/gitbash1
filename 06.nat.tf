resource "aws_eip" "PRD-EIP-01" {
  #domain = "vpc"
}

resource "aws_nat_gateway" "PRD-NGW-01" {
  allocation_id = aws_eip.PRD-EIP-01.id
  subnet_id     = aws_subnet.PRD-PUB-BASTION-2A.id
  tags = {
    "Name" = "PRD-NGW-01"
  }

}

resource "aws_eip" "PRD-EIP-02" {
  #domain = "vpc"
}
resource "aws_nat_gateway" "PRD-NGW-02" {
  allocation_id = aws_eip.PRD-EIP-02.id
  subnet_id     = aws_subnet.PRD-PUB-BASTION-2C.id
  tags = {
    "Name" = "PRD-NGW-02"
  }

}

/*resource "aws_eip" "DEV-EIP-01" {
  domain = "vpc"

}

resource "aws_eip" "DEV-EIP-02" {
  domain = "vpc"

}

resource "aws_nat_gateway" "DEV-NGW-01" {
  allocation_id = aws_eip.DEV-EIP-01.id
  subnet_id     = aws_subnet.DEV-PUB-BASTION-2A.id
  tags = {
    "Name" = "DEV-NGW-01"
  }

}

resource "aws_nat_gateway" "DEV-NGW-02" {
  allocation_id = aws_eip.DEV-EIP-02.id
  subnet_id     = aws_subnet.DEV-PUB-BASTION-2C.id
  tags = {
    "Name" = "DEV-NGW-02"
  }

}
*/
