resource "aws_sqs_queue" "sfn_queue" {
  name = "terraform-example-queue"

  max_message_size          = 2048
  message_retention_seconds = 1209600
  receive_wait_time_seconds = 10

  sqs_managed_sse_enabled = true

  tags = local.tags
}
