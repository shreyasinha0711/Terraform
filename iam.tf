resource "aws_iam_role" "lambda-role-dev" {
    name = var.lambda_role
    assume_role_policy = "${file("IAM/iam_role.json")}"
}

resource "aws_iam_role_policy" "lambda-policy-dev" {
    name = var.lambda_policy
    role = aws_iam_role.lambda-role-dev.id
    policy = "${file("IAM/iam_policy.json")}"
}

resource "aws_iam_role" "validation-lambda-role-dev" {
    name = var.lambda_validation_role
    assume_role_policy = "${file("IAM/iam_role.json")}"
}

resource "aws_iam_role_policy" "validation-lambda-policy-dev" {
    name = var.lambda_validation_policy
    role = aws_iam_role.validation-lambda-role-dev.id
    policy = "${file("IAM/iam_policy_validation_lambda.json")}"
}