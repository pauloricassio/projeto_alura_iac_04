terraform {
  backend "s3" {
    bucket = "projeto-iac"
    key    = "Prod/terraform.tfstate"
    region = "us-east-1"
  }
}
