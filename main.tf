terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.75"
    }
  }
}
provider "aws" {
  region  = "eu-central-1"
  profile = "private"
}