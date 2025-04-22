resource "aws_lambda_function" "my_lambda" {
  function_name = var.lambda_function_name
  handler       = "main"
  runtime       = "go1.x"
  role          = aws_iam_role.lambda_exec.arn
  filename      = "path/to/your/deployment/package.zip"
  source_code_hash = filebase64sha256("path/to/your/deployment/package.zip")

  environment {
    key   = "value"
  }
}

output "lambda_function_arn" {
  value = aws_lambda_function.my_lambda.arn
}

output "lambda_function_name" {
  value = aws_lambda_function.my_lambda.function_name
}