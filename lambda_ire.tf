resource "aws_security_group" "lambda-sg-ire-dev" {
  name        = var.lambda_sg_name_ire
  description = "Allow TLS outbound traffic"
  vpc_id      =  data.aws_vpc.vpc_id_ire.id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
 
  tags = {
    "id" = "121",
    "env" = "DEVELOPMENT",
    "fin" = "111",
    "Name" = "sg-ire-dev"
  }
}

resource "aws_lambda_function" "first-lambda-ire-dev" {
  function_name = "first-lambda-ire-dev"
  description   = "Lambda to test First Deployment through Terraform"
  s3_bucket   = var.s3_bucket_statefile
  s3_key = "lambdas/first.zip"
  source_code_hash = filebase64sha256("lambdas/first.zip")
  role = aws_iam_role.lambda-role-dev.arn
  vpc_config {
    subnet_ids = [ data.aws_subnet.subnet_id_1_enterprise_ire.id , data.aws_subnet.subnet_id_2_enterprise_ire.id , data.aws_subnet.subnet_id_3_enterprise_ire.id ]
    security_group_ids = [ aws_security_group.lambda-sg-ire-dev.id ]
   }
  timeout     = 900
  runtime          = "python3.8"
  handler          = "lambda_function.lambda_handler"

    "id" = "121",
    "env" = "DEVELOPMENT",
    "fin" = "111",
    "Name" = "first-lambda-ire-dev"
}

resource "aws_lambda_function" "sec-lambda-ire-dev" {
  function_name = "sec-lambda-ire-dev"
  description   = "Lambda to test sec Deployment through Terraform"
  s3_bucket   = var.s3_bucket_statefile
  s3_key = "lambdas/sec.zip"
  source_code_hash = filebase64sha256("lambdas/sec.zip")
  role = aws_iam_role.lambda-role-dev.arn
  vpc_config {
    subnet_ids = [ data.aws_subnet.subnet_id_1_enterprise_ire.id , data.aws_subnet.subnet_id_2_enterprise_ire.id , data.aws_subnet.subnet_id_3_enterprise_ire.id ]
    security_group_ids = [ aws_security_group.lambda-sg-ire-dev.id ]
   }
  timeout     = 900
  runtime          = "python3.8"
  handler          = "lambda_function.lambda_handler"

  tags = {
    "id" = "121",
    "env" = "DEVELOPMENT",
    "fin" = "111",
    "Name" = "sec-lambda-ire-dev"
  }
}