resource "aws_dynamodb_table" "step_function_table" {
  name           = "StepDataRecords"
  billing_mode   = "PROVISIONED"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "MessageId"

  attribute {
    name = "MessageId"
    type = "S"
  }

  tags = {
    Name        = "StepDataRecords"
    Environment = "dev"
  }
}
