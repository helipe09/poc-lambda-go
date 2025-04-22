output "lambda_function_name" {
  value       = aws_lambda_function.my_lambda.function_name
  description = "Nome da função Lambda"
}

output "lambda_function_arn" {
  value       = aws_lambda_function.my_lambda.arn
  description = "ARN da função Lambda"
}