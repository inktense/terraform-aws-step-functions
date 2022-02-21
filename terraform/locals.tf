locals {
  tags = {
    Environment = terraform.workspace
    Repo        = "Terraform-aws-step-functions"
  }
}
