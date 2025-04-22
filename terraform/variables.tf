variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
  default     = "my_lambda_function"
}

variable "lambda_handler" {
  description = "The handler for the Lambda function"
  type        = string
  default     = "main.Handler"
}

variable "lambda_runtime" {
  description = "The runtime for the Lambda function"
  type        = string
  default     = "go1.x"
}

variable "lambda_memory_size" {
  description = "The amount of memory available to the function"
  type        = number
  default     = 128
}

variable "lambda_timeout" {
  description = "The amount of time that Lambda allows a function to run before stopping it"
  type        = number
  default     = 3
}

variable "aws_region" {
  description = "The AWS region to deploy the Lambda function"
  type        = string
  default     = "us-east-1"
}