resource "aws_lambda_function" "source-validation-lambda-ire-dev" {
  function_name = "source-validation-lambda-ire-dev"
  description   = "Lambda to validate the source files (TXT) before conversion through Terraform"
  s3_bucket   = var.s3_bucket_statefile
  s3_key = "lambdas/source-validation.zip"
  source_code_hash = filebase64sha256("lambdas/source-validation.zip")
  role = aws_iam_role.validation-lambda-role-dev.arn
  vpc_config {
    subnet_ids = [ data.aws_subnet.subnet_id_1_enterprise_ire.id , data.aws_subnet.subnet_id_2_enterprise_ire.id , data.aws_subnet.subnet_id_3_enterprise_ire.id ]
    security_group_ids = [ aws_security_group.lambda-sg-ire-dev.id ]
   }
  timeout     = 900
  runtime          = "python3.9"
  handler          = "lambda_function.lambda_handler"

  tags = {
    "id" = "121",
    "env" = "DEVELOPMENT",
    "fin" = "111",
    "Name" = "lambda-ire-dev"
  }
}

resource "aws_lambda_permission" "lp-bucket-ire-dev" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.source-validation-lambda-ire-dev.arn
  principal     = "s3.amazonaws.com"
  source_arn    = data.aws_s3_bucket.source-bucket-ire-dev.arn
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = data.aws_s3_bucket.source-bucket-ire-dev.id
  lambda_function {
    lambda_function_arn = aws_lambda_function.source-validation-lambda-ire-dev.arn
    events              = ["s3:ObjectCreated:*"]
    filter_suffix       = ".txt"
    }
  depends_on = [aws_lambda_permission.lp-bucket-ire-dev]
}