# PRD public subnet
resource "aws_subnet" "PRD-PUB-BASTION-2A" {
  vpc_id                  = aws_vpc.PRD-VPC.id
  cidr_block              = "10.250.1.0/24"
  availability_zone       = "ap-northeast-2a"
  map_public_ip_on_launch = "true"
  tags = {
    "Name"                              = "PRD-PUB-BASTION-2A"
    "kubernetes.io/role/elb"            = "1"
    "kubernetes.io/cluster/PRD-cluster" = "shared"

  }
}

resource "aws_subnet" "PRD-PUB-BASTION-2C" {
  vpc_id                  = aws_vpc.PRD-VPC.id
  cidr_block              = "10.250.2.0/24"
  availability_zone       = "ap-northeast-2c"
  map_public_ip_on_launch = "true"
  tags = {
    "Name"                              = "PRD-PUB-BASTION-2C"
    "kubernetes.io/role/elb"            = "1"
    "kubernetes.io/cluster/PRD-cluster" = "shared"

  }
}

# PRD pirvate subnet
resource "aws_subnet" "PRD-PRI-EKS-MANAGED-SERVER-2A" {
  vpc_id            = aws_vpc.PRD-VPC.id
  cidr_block        = "10.250.3.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name"                              = "PRD-PRI-EKS-MANAGED-SERVER-2A"
    "kubernetes.io/role/internal-elb"   = "1"
    "kubernetes.io/cluster/PRD-cluster" = "shared"

  }
}

resource "aws_subnet" "PRD-PRI-EFS-MANAGED-SERVER-2A" {
  vpc_id            = aws_vpc.PRD-VPC.id
  cidr_block        = "10.250.4.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name"                              = "PRD-PRI-EFS-MANAGED-SERVER-2A"
    "kubernetes.io/role/internal-elb"   = "1"
    "kubernetes.io/cluster/PRD-cluster" = "shared"

  }
}

resource "aws_subnet" "PRD-PRI-01-2A" {
  vpc_id            = aws_vpc.PRD-VPC.id
  cidr_block        = "10.250.5.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name"                              = "PRD-PRI-01-2A"
    "kubernetes.io/role/internal-elb"   = "1"
    "kubernetes.io/cluster/PRD-cluster" = "shared"

  }
}

resource "aws_subnet" "PRD-PRI-01-2C" {
  vpc_id            = aws_vpc.PRD-VPC.id
  cidr_block        = "10.250.6.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name"                              = "PRD-PRI-01-2C"
    "kubernetes.io/role/internal-elb"   = "1"
    "kubernetes.io/cluster/PRD-cluster" = "shared"

  }
}

resource "aws_subnet" "PRD-PRI-02-2A" {
  vpc_id            = aws_vpc.PRD-VPC.id
  cidr_block        = "10.250.7.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name"                              = "PRD-PRI-02-2A"
    "kubernetes.io/role/internal-elb"   = "1"
    "kubernetes.io/cluster/PRD-cluster" = "shared"

  }
}

resource "aws_subnet" "PRD-PRI-02-2C" {
  vpc_id            = aws_vpc.PRD-VPC.id
  cidr_block        = "10.250.8.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name"                              = "PRD-PRI-02-2C"
    "kubernetes.io/role/internal-elb"   = "1"
    "kubernetes.io/cluster/PRD-cluster" = "shared"

  }
}

resource "aws_subnet" "PRD-PRI-EKS-MANAGED-SERVER-2C" {
  vpc_id            = aws_vpc.PRD-VPC.id
  cidr_block        = "10.250.13.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name"                              = "PRD-PRI-EKS-MANAGED-SERVER-2C"
    "kubernetes.io/role/internal-elb"   = "1"
    "kubernetes.io/cluster/PRD-cluster" = "shared"

  }
}

resource "aws_subnet" "PRD-PRI-ARGOCD-MANAGED-SERVER-2C" {
  vpc_id            = aws_vpc.PRD-VPC.id
  cidr_block        = "10.250.14.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name"                              = "PRD-PRI-ARGOCD-MANAGED-SERVER-2C"
    "kubernetes.io/role/internal-elb"   = "1"
    "kubernetes.io/cluster/PRD-cluster" = "shared"

  }
}

# DEV public subnet
/*resource "aws_subnet" "DEV-PUB-BASTION-2A" {
  vpc_id                  = aws_vpc.DEV-VPC.id
  cidr_block              = "10.230.1.0/24"
  availability_zone       = "ap-northeast-2a"
  map_public_ip_on_launch = "true"
  tags = {
    "Name"                              = "DEV-PUB-BASTION-2A"
    "kubernetes.io/role/elb"            = "1"
    "kubernetes.io/cluster/prd-cluster" = "shared"

  }
}

resource "aws_subnet" "DEV-PUB-BASTION-2C" {
  vpc_id                  = aws_vpc.DEV-VPC.id
  cidr_block              = "10.230.2.0/24"
  availability_zone       = "ap-northeast-2c"
  map_public_ip_on_launch = "true"
  tags = {
    "Name"                              = "DEV-PUB-BASTION-2C"
    "kubernetes.io/role/elb"            = "1"
    "kubernetes.io/cluster/prd-cluster" = "shared"

  }
}

# DEV pirvate subnet
resource "aws_subnet" "DEV-PRI-EKS-MANAGED-SERVER-2A" {
  vpc_id            = aws_vpc.DEV-VPC.id
  cidr_block        = "10.230.3.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name"                              = "DEV-PRI-EKS-MANAGED-SERVER-2A"
    "kubernetes.io/role/internal-elb"   = "1"
    "kubernetes.io/cluster/prd-cluster" = "shared"

  }
}

resource "aws_subnet" "DEV-PRI-EKS-MANAGED-SERVER-2C" {
  vpc_id            = aws_vpc.DEV-VPC.id
  cidr_block        = "10.230.13.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name"                              = "DEV-PRI-EKS-MANAGED-SERVER-2C"
    "kubernetes.io/role/internal-elb"   = "1"
    "kubernetes.io/cluster/prd-cluster" = "shared"

  }
}

resource "aws_subnet" "DEV-PRI-EFS-MANAGED-SERVER-2A" {
  vpc_id            = aws_vpc.DEV-VPC.id
  cidr_block        = "10.230.4.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name"                              = "DEV-PRI-EFS-MANAGED-SERVER-2A"
    "kubernetes.io/role/internal-elb"   = "1"
    "kubernetes.io/cluster/prd-cluster" = "shared"

  }
}

resource "aws_subnet" "DEV-PRI-01-2A" {
  vpc_id            = aws_vpc.DEV-VPC.id
  cidr_block        = "10.230.5.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name"                              = "DEV-PRI-01-2A"
    "kubernetes.io/role/internal-elb"   = "1"
    "kubernetes.io/cluster/prd-cluster" = "shared"

  }
}

resource "aws_subnet" "DEV-PRI-01-2C" {
  vpc_id            = aws_vpc.DEV-VPC.id
  cidr_block        = "10.230.6.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name"                              = "DEV-PRI-01-2C"
    "kubernetes.io/role/internal-elb"   = "1"
    "kubernetes.io/cluster/prd-cluster" = "shared"

  }
}

resource "aws_subnet" "DEV-PRI-02-2A" {
  vpc_id            = aws_vpc.DEV-VPC.id
  cidr_block        = "10.230.7.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name"                              = "DEV-PRI-02-2A"
    "kubernetes.io/role/internal-elb"   = "1"
    "kubernetes.io/cluster/prd-cluster" = "shared"

  }
}

resource "aws_subnet" "DEV-PRI-02-2C" {
  vpc_id            = aws_vpc.DEV-VPC.id
  cidr_block        = "10.230.8.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name"                              = "DEV-PRI-02-2C"
    "kubernetes.io/role/internal-elb"   = "1"
    "kubernetes.io/cluster/prd-cluster" = "shared"

  }
}
*/
