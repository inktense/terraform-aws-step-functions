resource "aws_dynamodb_table" "step_function_table" {
  name           = var.dynamodb_table_name
  billing_mode   = "PROVISIONED"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "MessageId"

  attribute {
    name = "MessageId"
    type = "S"
  }

  tags = local.tags
}
