# resource "aws_iam_openid_connect_provider" "github" {
#   url = "https://token.actions.githubusercontent.com"

#   client_id_list = [
#     "sts.amazonaws.com"
#   ]

#   thumbprint_list = [
#     "6938fd4d98bab03faadb97b34396831e3780aea1"
#   ]
# }

# resource "aws_iam_role" "github_actions_role" {
#   name = var.github_actions_role_name

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Principal = {
#           Federated = aws_iam_openid_connect_provider.github.arn
#         }
#         Action = "sts:AssumeRoleWithWebIdentity"
#         Condition = {
#           StringEquals = {
#             "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
#           }
#           StringLike = {
#             "token.actions.githubusercontent.com:sub" = "repo:${var.github_actions_repo}:*"
#           }
#         }
#       }
#     ]
#   })
# }
# 

# resource "aws_iam_role_policy" "github_actions_policy" {
#   name = "${var.name_prefix}-github-actions-policy"
#   role = aws_iam_role.github_actions_role.id

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Action = [
#           "ecs:*",
#           "ec2:*",
#           "elasticloadbalancing:*",
#           "autoscaling:*",
#           "route53:*",
#           "ecr:*",
#           "logs:*",
#           "cloudwatch:*",
#           "s3:*",
#           "iam:*",
#           "kms:*",
#           "wafv2:*"
#         ]
#         Resource = "*"
#       }
#     ]
#   })
# }