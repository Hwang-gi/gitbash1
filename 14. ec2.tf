resource "aws_instance" "PRD-PUB-EC2-BASTION-2A" {
  ami                         = "ami-056a29f2eddc40520"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.PRD-SG-BASTION.id]
  subnet_id                   = aws_subnet.PRD-PUB-BASTION-2A.id
  key_name                    = "chang"
  associate_public_ip_address = true

  root_block_device {
    volume_size = "8"
    volume_type = "gp2"
    tags = {
      "Name" = "PRD-PUB-EC2-BASTION-2A"
    }
  }

  tags = {
    "Name" = "PRD-PUB-EC2-BASTION-2A"
  }
}

resource "aws_instance" "PRD-PUB-EC2-BASTION-2C" {
  ami                         = "ami-056a29f2eddc40520"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.PRD-SG-BASTION.id]
  subnet_id                   = aws_subnet.PRD-PUB-BASTION-2C.id
  key_name                    = "chang"
  associate_public_ip_address = true

  root_block_device {
    volume_size = "8"
    volume_type = "gp2"
    tags = {
      "Name" = "PRD-PUB-EC2-BASTION-2C"
    }
  }

  tags = {
    "Name" = "PRD-PUB-EC2-BASTION-2C"
  }
}


resource "aws_instance" "PRD-PRI-EC2-EKS-MANAGED-SERVER-2A" {
  ami                    = "ami-056a29f2eddc40520"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.PRD-SG-EKS-MANAGED-SERVER.id]
  subnet_id              = aws_subnet.PRD-PRI-EKS-MANAGED-SERVER-2A.id
  key_name               = "chang"

  root_block_device {
    volume_size = "20"
    volume_type = "gp2"
    tags = {
      "Name" = "PRD-PRI-EC2-EKS-MANAGED-SERVER-2A"
    }
  }

  tags = {
    "Name" = "PRD-PRI-EC2-EKS-MANAGED-SERVER-2A"
  }
}

resource "aws_instance" "PRD-PRI-EC2-EFS-MANAGED-SERVER-2A" {
  ami                    = "ami-056a29f2eddc40520"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.PRD-SG-EFS-MANAGED-SERVER.id]
  subnet_id              = aws_subnet.PRD-PRI-EFS-MANAGED-SERVER-2A.id
  key_name               = "chang"

  root_block_device {
    volume_size = "8"
    volume_type = "gp2"
    tags = {
      "Name" = "PRD-PRI-EC2-EFS-MANAGED-SERVER-2A"
    }
  }

  tags = {
    "Name" = "PRD-PRI-EC2-EFS-MANAGED-SERVER-2A"
  }
}


resource "aws_instance" "PRD-PRI-EC2-ARGOCD-MANAGED-SERVER-2C" {
  ami                    = "ami-056a29f2eddc40520"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.PRD-SG-ALB.id]
  subnet_id              = aws_subnet.PRD-PRI-ARGOCD-MANAGED-SERVER-2C.id
  key_name               = "chang"

  root_block_device {
    volume_size = "8"
    volume_type = "gp2"
    tags = {
      "Name" = "PRD-PRI-EC2-ARGOCD-MANAGED-SERVER-2C"
    }
  }

  tags = {
    "Name" = "PRD-PRI-EC2-ARGOCD-MANAGED-SERVER-2C"
  }
}

