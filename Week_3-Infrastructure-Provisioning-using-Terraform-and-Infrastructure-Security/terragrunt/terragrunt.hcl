generate "provider" {
  path      = "_provider.tf"
  if_exists = "overwrite"

  contents = <<EOF
provider "aws" {
  region  = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
}

variable "aws_region" {}
variable "access_key" {}
variable "secret_key" {}

EOF
}

# Load Variables
terraform {
  extra_arguments "common_vars" {
    commands = get_terraform_commands_that_need_vars()

    required_var_files = [
      find_in_parent_folders("common.tfvars"),
    ]
  }
}
