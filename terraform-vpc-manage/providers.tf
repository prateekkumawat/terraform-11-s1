terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.9.0"
    }
  }
  backend "s3" {
    key = "terraform-11am.tfstate"
    region = "ap-south-1"
    bucket = "snoooooow"
  }
}

provider "aws" {
  region = "ap-south-1"
  #access_key = ""
  #secret_key = ""
}