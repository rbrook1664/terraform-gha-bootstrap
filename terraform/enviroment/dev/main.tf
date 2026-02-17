# ---------------------------------------------------------------------------------------------------------------------
# GitHub ACTIONS
# ---------------------------------------------------------------------------------------------------------------------
module "actions" {
  source      = "../../modules/actions"
  name_prefix = var.name_prefix
  github_actions_role_name = var.github_actions_role_name
  github_actions_repo = var.github_actions_repo
}