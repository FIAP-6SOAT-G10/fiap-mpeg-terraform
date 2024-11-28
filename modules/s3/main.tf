resource "aws_s3_bucket" "terraform" {
  bucket = "3f-tc-terraform"

  tags = {
    Name        = "Terraform S3"
  }
}