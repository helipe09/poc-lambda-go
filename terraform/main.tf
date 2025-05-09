resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_lambda_function" "my_lambda" {
  function_name    = var.lambda_function_name
  filename         = "../bin/function.zip"
  source_code_hash = filebase64sha256("../bin/function.zip")
  handler          = var.lambda_handler
  runtime          = var.lambda_runtime
  memory_size      = var.lambda_memory_size
  timeout          = var.lambda_timeout
  role             = aws_iam_role.lambda_role.arn

  environment {
    variables = {
      ENV = "production"
    }
  }
}

resource "aws_iam_role" "lambda_role" {
  name = "${var.lambda_function_name}-role-${random_id.suffix.hex}"

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