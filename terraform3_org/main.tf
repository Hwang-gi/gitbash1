provider "aws" {
  region = var.region.default # 원하는 AWS 리전으로 변경
}

resource "aws_instance" "GitactionsTest" {
  ami           = var.ami.default           # 적절한 AMI ID로 변경
  instance_type = var.instance_type.default # 인스턴스 유형

  tags = {
    Name = "GitHub-Actions-Example"
  }
}

output "instance_id" {
  value = aws_instance.GitactionsTest.id
}
