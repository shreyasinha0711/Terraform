terraform {
  backend "s3" {
    bucket = "statefile-bucket-ire"
    key    = "state-files/terraform.tfstate"
    region = "eu-west-1"
  }
}
