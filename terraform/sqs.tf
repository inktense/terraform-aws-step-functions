resource "aws_sqs_queue" "sfn_queue" {
  name = "terraform-example-queue"

  max_message_size          = 2048
  message_retention_seconds = 1209600
  receive_wait_time_seconds = 10

  sqs_managed_sse_enabled = true

  #   redrive_policy = jsonencode({
  #     deadLetterTargetArn = aws_sqs_queue.terraform_queue_deadletter.arn
  #     maxReceiveCount     = 4
  #   })
  #   redrive_allow_policy = jsonencode({
  #     redrivePermission = "byQueue",
  #     sourceQueueArns   = ["${aws_sqs_queue.terraform_queue_deadletter.arn}"]
  #   })

  tags = local.tags
}
