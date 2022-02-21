locals {
  tags = {
    Environment = terraform.workspace
    Repo        = "Terraform-aws-step-functions"
  }

  account_id = data.aws_caller_identity.current.account_id
}
