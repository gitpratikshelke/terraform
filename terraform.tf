terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  # backend "s3" {

  #   bucket = "tf-remote-bucket-t"
  #   region = "eu-west-1"
  #   key = "terraform.tfstate"
  #   dynamodb_table = "tf-dynamodb-table"
  # }
}