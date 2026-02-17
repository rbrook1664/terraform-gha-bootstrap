variable "name_prefix" {
  description = "Name used for codebuild VPC"
  type        = string
}
variable "github_actions_role_name" {
  description = "Name of the IAM role for GitHub Actions"
  type        = string
  
}

variable "github_actions_repo" {
  description = "GitHub repository in the format 'owner/repo' for which the IAM role will be assumed"
  type        = string
  
}