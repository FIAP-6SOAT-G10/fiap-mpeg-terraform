terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.77.0"
    }

    mongodbatlas = {
      source = "mongodb/mongodbatlas"
      version = "1.21.4"
    }
  }
}

provider "mongodbatlas" {
  public_key    = "xnkugwgf"
  private_key   = "7d5a730b-cb5f-4496-8fb5-5ffaf7d5a0f3"
}