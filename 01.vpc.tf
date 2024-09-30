resource "aws_vpc" "PRD-VPC" {
  cidr_block           = "10.250.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "Name" = "PRD-VPC"
  }
}

resource "aws_vpc" "DEV-VPC" {
  cidr_block           = "10.230.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "Name" = "DEV-VPC"
  }
}
