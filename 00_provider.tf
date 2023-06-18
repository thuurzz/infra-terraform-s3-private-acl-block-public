terraform {
  required_version = ">= 0.12.0"

  backend "s3" {
    bucket = "terraform-state-4-apps"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.4.0"
    }
  }
}
