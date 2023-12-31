terraform {
  cloud {
    organization = "Beamar_org"

    workspaces {
      name = "terra-house-1"
    }
  }
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.25.0"
    }
  }
}


provider "aws" {
  # Configuration options
}

variable "ami_id" {
    // Ubuntu Server 18.04 LTS (HVM), SSD Volume Type - in us-west-2 
    // default = "ami-0d1cd67c26f5fca19"
    // Ubuntu Server 20.04 LTS (HVM), SSD Volume Type - in us-west-2
    default = "ami-09dd2e08d601bff67"
}

provider "random" {
  # Configuration options
}

resource "random_string" "bucket_name" {
  length           = 32
  special          = false
  lower = true
  upper = false
}

output "random_bucket_name" {
    value = random_string.bucket_name.id
}

resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.id

}