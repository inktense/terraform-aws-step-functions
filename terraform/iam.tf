
#--------------------------------------------------------------
# Lambda
#--------------------------------------------------------------
resource "aws_iam_policy" "dynamodb_policy" {
  name = "${terraform.workspace}-StepFunctionDemo-Policy"

  policy = data.aws_iam_policy_document.dynamodb_inline_policy.json
}

resource "aws_iam_role" "lambda_role" {
  name               = "${terraform.workspace}-StepFunctionDemo-Role"
  assume_role_policy = data.aws_iam_policy_document.dynamodb_role_trust.json
}

resource "aws_iam_role_policy_attachment" "dynamodb_role_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.dynamodb_policy.arn
}

data "aws_iam_policy_document" "dynamodb_inline_policy" {
  statement {
    actions = [
      "dynamodb:PutItem",
    ]
    resources = [
      "${aws_dynamodb_table.step_function_table.arn}"
    ]
  }
}

data "aws_iam_policy_document" "dynamodb_role_trust" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

#--------------------------------------------------------------
# SQS
#--------------------------------------------------------------
data "aws_iam_policy_document" "sqs_iam_policy" {
  policy_id = "SEScomplaintsQueueTopic"
  # statement {
  #   sid       = "SEScomplaintsQueueTopic"
  #   effect    = "Allow"
  #   actions   = ["SQS:SendMessage"]
  #   resources = [aws_sqs_queue.ses_complaints_queue.arn]
  #   principals {
  #     identifiers = ["*"]
  #     type        = "*"
  #   }
  #   condition {
  #     test     = "ArnEquals"
  #     values   = [aws_sns_topic.ses_complaints_topic.arn]
  #     variable = "aws:SourceArn"
  #   }
  # }
}
