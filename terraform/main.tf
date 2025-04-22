resource "aws_lambda_function" "my_lambda" {
  function_name = var.lambda_function_name
  handler       = "main"
  runtime       = "go1.x"
  role          = aws_iam_role.lambda_exec.arn
  source_code_hash = filebase64sha256("src/main.zip")
  filename      = "src/main.zip"

  environment {
    KEY = "value"
  }
}

resource "aws_iam_role" "lambda_exec" {
  name = "${var.lambda_function_name}-exec"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = ""
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "lambda_policy" {
  name       = "${var.lambda_function_name}-policy-attachment"
  roles      = [aws_iam_role.lambda_exec.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

output "lambda_function_arn" {
  value = aws_lambda_function.my_lambda.arn
}