terraform {
  required_version = ">= 0.13.6, < 2.0"

  backend "remote" {
    organization = "lo-petgrackle"

    workspaces {
      name = "terraform-cloud"
    }
  }
}

module "workspaces" {
  source  = "scalefactory/workspaces/tfe"
  version = "1.2.1"

  organization   = "lo-petgrackle"
  oauth_token_id = var.oauth_token_id
  vcs_org        = "losojos27"
  vcs_repo       = "tfe-workspace-vcs-random-pet"
  #tf_version     = "1.x.y"
  workspaces         = var.workspaces
  slacks             = var.slacks
  triggers           = var.triggers
  TFC_WORKSPACE_NAME = var.TFC_WORKSPACE_NAME

  var_sets = var.var_sets

  vars = {
    AWS_ACCESS_KEY_ID = var.aws_access_key_id
  }

  sec_vars = {
    AWS_SECRET_ACCESS_KEY = var.aws_secret_access_key
  }
}
