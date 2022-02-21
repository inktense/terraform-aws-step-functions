variable "aws_region" {
  description = "Region where main resources should be created."
  type        = string
  default     = "eu-west-2"
}

variable "lambda_name" {
  description = "Name of the step function invoked Lambda"
  type        = string
  default     = "step-function-demo-lambda"
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table"
  type        = string
  default     = "StepDataRecords"
}
