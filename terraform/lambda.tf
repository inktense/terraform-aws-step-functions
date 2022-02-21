resource "aws_lambda_function" "step-function-lambda" {
  filename      = "lambda_function_payload.zip"
  function_name = var.lambda_name
  role          = aws_iam_role.lambda_role.arn
  handler       = "index.lambda_handler"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = filebase64sha256("lambda_function_payload.zip")

  environment {
    variables = {
      DYNAMODB = var.dynamodb_table_name
    }
  }

  runtime = "nodejs12.x"

}
