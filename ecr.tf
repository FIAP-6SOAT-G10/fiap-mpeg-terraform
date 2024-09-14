resource "aws_ecr_repository" "fiap_fast_food_ecr" {
  name                 = "fiap_fast_food_ecr"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}