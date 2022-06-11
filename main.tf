terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-2"
  profile = "default"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0aeb7c931a5a61206"
  instance_type = "t2.micro"
  key_name = "access_terraform"

  tags = {
    Name = "Ubuntu"
  }
}