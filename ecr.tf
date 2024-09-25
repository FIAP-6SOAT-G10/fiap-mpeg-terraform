resource "aws_ecr_repository" "fiap_fast_food_app" {
  name                 = "fiap_fast_food_app"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}