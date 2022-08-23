terraform {
  extra_arguments "conditional_vars" {
    commands = get_terraform_commands_that_need_vars()

    arguments = [
      "-var", "region=us-east-1",
    ]

    # No longer a need to pass in bucket name with this.
    env_vars = {
      TF_VAR_state_bucket = "cyberworld-terraform-state"
    }
  }
}

remote_state {
  backend = "s3"

  config = {
    bucket         = "cyberworld-terraform-state"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-table"

    s3_bucket_tags = {
      name      = "Terraform state storage"
      Terraform = "true"
      Role      = "Devops"
    }

    dynamodb_table_tags = {
      Name      = "Terraform lock table"
      Role      = "Devops"
      Terraform = "true"
    }
  }
}
