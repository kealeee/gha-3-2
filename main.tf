terraform {
  backend "s3" {
    bucket = "gha-3-2-bucket"
    key    = "gha-3-2/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "workshop" {
  bucket_prefix = "kean-gha-3-2-"
}