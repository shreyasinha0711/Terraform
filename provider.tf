provider "aws" {
  region     = var.aws_region_ire
  profile = "profile_name"
 
}

provider "aws" {
  region = var.aws_region_sin
  alias = "region_sin"
}