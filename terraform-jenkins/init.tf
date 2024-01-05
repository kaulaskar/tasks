terraform {
  backend "s3" {
    bucket = "terraform-state-files01" #give bucket name of your s3
    key    = "dev/module.tfstate"  #give path for file of your s3
    region = "ap-south-1"
  }
}

provider "aws" {
  region = "ap-south-1"
}