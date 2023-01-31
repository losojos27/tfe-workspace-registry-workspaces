terraform {
  cloud {
    organization = "lo-petgrackle"

    workspaces {
      name = "terraform-cloud"
    }
  }
}

provider "tfe" {
  # hostname = var.hostname # Optional, defaults to Terraform Cloud `app.terraform.io`
  token   = var.tfc_token
  # version = "~> 0.41.0"
}


module "workspaces" {
  source  = "scalefactory/workspaces/tfe"
  version = "1.2.1"

  organization   = var.organization
  oauth_token_id = var.oauth_token_id
  vcs_org        = var.vcs_org
  vcs_repo       = var.vcs_repo
  # tf_version     = "1.x.y"
  workspaces = var.workspaces
  # slacks             = var.slacks
  # triggers           = var.triggers
  TFC_WORKSPACE_NAME = var.TFC_WORKSPACE_NAME

  # var_sets = var.var_sets

  vars = {
    AWS_ACCESS_KEY_ID = var.aws_access_key_id
  }

  sec_vars = {
    AWS_SECRET_ACCESS_KEY = var.aws_secret_access_key
  }
}
