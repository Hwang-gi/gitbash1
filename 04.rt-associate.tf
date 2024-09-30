resource "aws_route_table_association" "PRD-RT-ASSOCIATE-PUB-BASTION-2A" {
  subnet_id      = aws_subnet.PRD-PUB-BASTION-2A.id
  route_table_id = aws_route_table.PRD-RT-PUB.id
}

resource "aws_route_table_association" "PRD-RT-ASSOCIATE-PUB-BASTION-2C" {
  subnet_id      = aws_subnet.PRD-PUB-BASTION-2C.id
  route_table_id = aws_route_table.PRD-RT-PUB.id
}

resource "aws_route_table_association" "PRD-RT-ASSOCIATE-PRI-EKS-MANAGED-SERVER-2A" {
  subnet_id      = aws_subnet.PRD-PRI-EKS-MANAGED-SERVER-2A.id
  route_table_id = aws_route_table.PRD-RT-PRI-01.id
}

resource "aws_route_table_association" "PRD-RT-ASSOCIATE-PRI-EFS-MANAGED-SERVER-2A" {
  subnet_id      = aws_subnet.PRD-PRI-EFS-MANAGED-SERVER-2A.id
  route_table_id = aws_route_table.PRD-RT-PRI-01.id
}

resource "aws_route_table_association" "PRD-RT-ASSOCIATE-PRI-01-2A" {
  subnet_id      = aws_subnet.PRD-PRI-01-2A.id
  route_table_id = aws_route_table.PRD-RT-PRI-01.id
}

resource "aws_route_table_association" "PRD-RT-ASSOCIATE-PRI-01-2C" {
  subnet_id      = aws_subnet.PRD-PRI-01-2C.id
  route_table_id = aws_route_table.PRD-RT-PRI-02.id
}

resource "aws_route_table_association" "PRD-RT-ASSOCIATE-PRI-02-2A" {
  subnet_id      = aws_subnet.PRD-PRI-02-2A.id
  route_table_id = aws_route_table.PRD-RT-PRI-01.id
}

resource "aws_route_table_association" "PRD-RT-ASSOCIATE-PRI-02-2C" {
  subnet_id      = aws_subnet.PRD-PRI-02-2C.id
  route_table_id = aws_route_table.PRD-RT-PRI-02.id
}

resource "aws_route_table_association" "PRD-RT-ASSOCIATE-ARGOCD-MANAGED-SERVER-2C" {
  subnet_id      = aws_subnet.PRD-PRI-ARGOCD-MANAGED-SERVER-2C.id
  route_table_id = aws_route_table.PRD-RT-PRI-02.id
}

/*resource "aws_route_table_association" "DEV-RT-ASSOCIATE-PUB-BASTION-2A" {
  subnet_id      = aws_subnet.DEV-PUB-BASTION-2A.id
  route_table_id = aws_route_table.DEV-RT-PUB.id
}

resource "aws_route_table_association" "DEV-RT-ASSOCIATE-PUB-BASTION-2C" {
  subnet_id      = aws_subnet.DEV-PUB-BASTION-2C.id
  route_table_id = aws_route_table.DEV-RT-PUB.id
}

resource "aws_route_table_association" "DEV-RT-ASSOCIATE-PRI-EKS-MANAGED-SERVER-2A" {
  subnet_id      = aws_subnet.DEV-PRI-EKS-MANAGED-SERVER-2A.id
  route_table_id = aws_route_table.DEV-RT-PRI-01.id
}

resource "aws_route_table_association" "DEV-RT-ASSOCIATE-PRI-EFS-MANAGED-SERVER-2A" {
  subnet_id      = aws_subnet.DEV-PRI-EFS-MANAGED-SERVER-2A.id
  route_table_id = aws_route_table.DEV-RT-PRI-01.id
}

resource "aws_route_table_association" "DEV-RT-ASSOCIATE-PRI-01-2A" {
  subnet_id      = aws_subnet.DEV-PRI-01-2A.id
  route_table_id = aws_route_table.DEV-RT-PRI-01.id
}

resource "aws_route_table_association" "DEV-RT-ASSOCIATE-PRI-01-2C" {
  subnet_id      = aws_subnet.DEV-PRI-01-2C.id
  route_table_id = aws_route_table.DEV-RT-PRI-02.id
}

resource "aws_route_table_association" "DEV-RT-ASSOCIATE-PRI-02-2A" {
  subnet_id      = aws_subnet.DEV-PRI-02-2A.id
  route_table_id = aws_route_table.DEV-RT-PRI-01.id
}

resource "aws_route_table_association" "DEV-RT-ASSOCIATE-PRI-02-2C" {
  subnet_id      = aws_subnet.DEV-PRI-02-2C.id
  route_table_id = aws_route_table.DEV-RT-PRI-02.id
}
*/
