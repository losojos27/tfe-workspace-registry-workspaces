terraform {
  required_version = ">= 0.13.6, < 2.0"
}

provider "tfe" {
  token = var.tfc_token
}


module "workspaces" {
  source  = "scalefactory/workspaces/tfe"
  version = "1.2.1"

  organization   = var.organization
  oauth_token_id = var.oauth_token_id
  vcs_org        = var.vcs_org
  vcs_repo       = var.vcs_repo
  workspaces     = var.workspaces

  # tf_version   = "1.x.y"
  # slacks       = var.slacks
  # triggers     = var.triggers

  TFC_WORKSPACE_NAME = var.TFC_WORKSPACE_NAME

  # var_sets = var.var_sets

  vars = {
    AWS_ACCESS_KEY_ID = var.aws_access_key_id
  }

  sec_vars = {
    AWS_SECRET_ACCESS_KEY = var.aws_secret_access_key
  }
}
