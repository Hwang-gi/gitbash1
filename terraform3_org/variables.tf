variable "region" {
  description = "AWS region"
  default     = "ap-northeast-2"
}

variable "instance_type" {
  description = "Type of EC2"
  default     = "t2.micro"
}

variable "ami" {
  description = "AMI ID"
  default     = "ami-042e76978adeb8c48" # 적절한 AMI ID로 변경
}
