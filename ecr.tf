resource "aws_ecr_repository" "ecr-front" {
  name                 = "final-front"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "final-front"
  }
}

resource "aws_ecr_repository" "ecr-back" {
  name                 = "final-back"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    Name = "final-back"
  }
}
