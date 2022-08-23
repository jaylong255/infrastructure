terraform {
  extra_arguments "conditional_vars" {
    commands = get_terraform_commands_that_need_vars()

    arguments = [
      "-var", "region=us-west-1",
    ]

    required_var_files = [
      "${get_parent_terragrunt_dir()}/${get_env("TF_VAR_env", "IFAIL")}.tfvars",
    ]

    # No longer a need to pass in bucket name with this.
    env_vars = {
      TF_VAR_state_bucket = "cyberworld-terraform-state-us-west-1"
    }
  }
}

remote_state {
  backend = "s3"

  config = {
    bucket         = "cyberworld-terraform-state-us-west-1"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-west-1"
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
