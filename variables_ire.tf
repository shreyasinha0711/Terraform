variable "aws_region_ire" {
  description = "AWS region selected for deployment Ireland"
  type        = string
  default     = "eu-west-1"
}

variable "security_group_id_web_world_ire" {
  description = "ID of the Security Group for alb"
  type        = string
  default     = "sg-"
}

variable "security_group_id_default_ire" {
  description = "ID of the Security Group for alb"
  type        = string
  default     = "sg-"
}

variable "s3_bucket_statefile" {
  description = "Name of the S3 bucket used for storing lambda and state files"
  type        = string
  default     = "tf-bucket-ire-dev"
}

variable "lambda_sg_name_ire" {
  description = "Name of the security group attached to lambda"
  type        = string
  default     = "lambda-sg-ire-dev"
}

variable "s3_bucket_source_ire" {
  description = "Name of the S3 bucket used for storing sparrow text files"
  type        = string
  default     = "poc-testbucket"
}

variable "lambda_role" {
  description = "Name of the role attached to Lambda"
  type        = string
  default     = "lambda-role-dev"
}

variable "lambda_policy" {
  description = "Name of the policy attached to Lambda"
  type        = string
  default     = "lambda-policy-dev"
}

variable "lambda_validation_role" {
  description = "Name of the role attached to Lambda"
  type        = string
  default     = "validation-lambda-role-dev"
}

variable "lambda_validation_policy" {
  description = "Name of the policy attached to Lambda"
  type        = string
  default     = "validation-lambda-policy-dev"
}
variable "account_alias" {
  description = "profile name of AWS"
  type        = string
  default     = "profile_name"
}
