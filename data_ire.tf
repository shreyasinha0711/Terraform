data "aws_vpc" "vpc_id_ire" {  
  filter {
    name   = "tag:Name"
    values = ["vpc-ire"]
  }
}

data "aws_subnet" "subnet_id_1_enterprise_ire" { 
  filter {
    name   = "tag:Name"
    values = ["${var.account_alias}-enterprise-eu-west-1a"] 
  }
}

data "aws_subnet" "subnet_id_2_enterprise_ire" { 
  filter {
    name   = "tag:Name"
    values = ["${var.account_alias}-enterprise-eu-west-1b"] 
  }
}

data "aws_subnet" "subnet_id_3_enterprise_ire" {
  filter {
    name   = "tag:Name"
    values = ["${var.account_alias}-enterprise-eu-west-1c"] 
  }
}

data "aws_subnet" "subnet_id_1_public_ire" {
  filter {
    name   = "tag:Name"
    values = ["${var.account_alias}-public-eu-west-1a"] 
  }
}

data "aws_subnet" "subnet_id_2_public_ire" {
  filter {
    name   = "tag:Name"
    values = ["${var.account_alias}-public-eu-west-1b"] 
  }
}

data "aws_subnet" "subnet_id_3_public_ire" {
  filter {
    name   = "tag:Name"
    values = ["${var.account_alias}-public-eu-west-1c"] 
  }
} 

data "aws_s3_bucket" "source-bucket-ire" {
  bucket = var.source-bucket-ire
}