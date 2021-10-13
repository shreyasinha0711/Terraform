data "aws_vpc" "vpc_id_sin" {
  provider = aws.region_sin
  filter {
    name   = "tag:Name"
    values = ["vpc-sin"]
  }
}

data "aws_subnet" "subnet_id_1_enterprise_sin" {
  provider = aws.region_sin
  filter {
    name   = "tag:Name"
    values = ["${var.account_alias}-enterprise-ap-southeast-1a"] 
  }
}

data "aws_subnet" "subnet_id_2_enterprise_sin" {
  provider = aws.region_sin 
  filter {
    name   = "tag:Name"
    values = ["${var.account_alias}-enterprise-ap-southeast-1b"] 
  }
}

data "aws_subnet" "subnet_id_3_enterprise_sin" {
  provider = aws.region_sin 
  filter {
    name   = "tag:Name"
    values = ["${var.account_alias}-enterprise-ap-southeast-1c"] 
  }
}

data "aws_subnet" "subnet_id_1_public_sin" {
  provider = aws.region_sin 
  filter {
    name   = "tag:Name"
    values = ["${var.account_alias}-public-ap-southeast-1a"] 
  }
}

data "aws_subnet" "subnet_id_2_public_sin" {
  provider = aws.region_sin 
  filter {
    name   = "tag:Name"
    values = ["${var.account_alias}-public-ap-southeast-1b"] 
  }
}

data "aws_subnet" "subnet_id_3_public_sin" {
  provider = aws.region_sin
  filter {
    name   = "tag:Name"
    values = ["${var.account_alias}-public-ap-southeast-1c"] 
  }
} 
