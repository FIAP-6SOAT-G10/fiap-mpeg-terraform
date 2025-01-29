resource "aws_ecr_repository" "fiap_mpeg_uploader" {
  name                 = "fiap-mpeg-uploader"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "fiap_mpeg_notificator" {
  name                 = "fiap-mpeg-notificator"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "fiap_mpeg_processor" {
  name                 = "fiap-mpeg-processor"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }
}