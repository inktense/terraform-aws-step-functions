module "step_function" {
  source = "terraform-aws-modules/step-functions/aws"

  name = "transfer-data-step-function"

  definition = templatefile("./definitions/step_functions.json", {
    lambdaArn         = aws_lambda_function.step-function-lambda.arn,
    DynamoDbTableName = "StepDataRecords",
    QueueUrl          = aws_sqs_queue.sfn_queue.url,
  })

  service_integrations = {
    dynamodb = {
      dynamodb = [
        aws_dynamodb_table.step_function_table.arn
      ]
    }

    lambda = {
      lambda = [
        aws_lambda_function.step-function-lambda.arn
      ]
    }

    sqs = {
      sqs = [
        aws_sqs_queue.sfn_queue.arn
      ]
    }
  }

  type = "STANDARD"

  tags = local.tags
}
