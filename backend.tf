terraform {
  backend "s3" {
    bucket = "3f-tc-terraform"
    key = "tfstate/terraform.tfstate"
    region = "us-east-1"
  }
}