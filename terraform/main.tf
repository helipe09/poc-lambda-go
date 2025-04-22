resource "aws_lambda_function" "my_lambda" {
  function_name    = "go-lambda-function"
  filename         = "../bin/function.zip"
  source_code_hash = filebase64sha256("../bin/function.zip")
  handler          = "bootstrap"
  runtime          = "provided.al2"
  role             = aws_iam_role.lambda_role.arn

  environment {
    variables = {
      ENV = "production"
    }
  }
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_basic" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

output "lambda_function_arn" {
  value = aws_lambda_function.my_lambda.arn
}