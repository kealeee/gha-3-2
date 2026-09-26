terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }

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

  #checkov:skip=CKV_AWS_18:Workshop bucket, access logging not required
  #checkov:skip=CKV_AWS_21:Workshop bucket, versioning not required
  #checkov:skip=CKV_AWS_144:Workshop bucket, cross-region replication not required
  #checkov:skip=CKV_AWS_145:Workshop bucket, KMS encryption not required
  #checkov:skip=CKV2_AWS_6:Workshop bucket, public access block not required
  #checkov:skip=CKV2_AWS_61:Workshop bucket, lifecycle configuration not required
  #checkov:skip=CKV2_AWS_62:Workshop bucket, event notifications not required
}