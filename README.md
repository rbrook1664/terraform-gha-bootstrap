# terraform-gha-bootstrap
Terraform Bootstrap Template

This repository is a Terraform bootstrap template designed to quickly set up a new Terraform project with:

GitHub Actions CI pipeline

Pre-commit hooks

Standard project structure

Terraform best practices

Secure-by-default configuration

It provides the foundational scaffolding required to start managing infrastructure safely and consistently.

📦 What This Repository Provides
.github/

GitHub Actions workflows for:

Terraform fmt

Terraform validate

Terraform plan

Optional apply

OIDC-ready CI configuration (recommended)

This enables CI/CD for Terraform from day one.

terraform/

Contains the Terraform project structure:

main.tf

providers.tf

variables.tf

outputs.tf

Optional backend.tf

This is where infrastructure code lives.

.gitignore

Preconfigured to ignore:

.terraform/

terraform.tfstate

*.tfstate.*

.terraform.lock.hcl (optional depending on policy)

Sensitive files

Prevents committing local state and credentials.

.pre-commit-config.yaml

Preconfigured hooks for:

terraform fmt

terraform validate

tflint

trailing-whitespace

end-of-file-fixer

YAML linting

Ensures code quality before commit.

install-pre-commit.sh

Convenience script to:

chmod +x install-pre-commit.sh
./install-pre-commit.sh


This installs:

pre-commit

Terraform hooks

Git hook integration

🚀 Quick Start
1️⃣ Clone This Template
git clone <this-repo> my-new-infra-repo
cd my-new-infra-repo

2️⃣ Install Pre-commit Hooks
./install-pre-commit.sh


Or manually:

pip install pre-commit
pre-commit install

3️⃣ Initialize Terraform
cd terraform
terraform init
terraform fmt
terraform validate

4️⃣ Configure Remote State (Recommended)

Before applying infrastructure, configure:

S3 backend

DynamoDB locking (optional but recommended)

KMS encryption

Example:

terraform {
  backend "s3" {
    bucket         = "my-tfstate-bucket"
    key            = "env/dev/terraform.tfstate"
    region         = "eu-west-2"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}

🏗 Recommended Usage Pattern

This template is ideal for:

New infrastructure repositories

Environment-based repos (dev/test/prod)

Service-based repos

Bootstrap repositories

🧠 What “Bootstrap” Means

This template can also be used as a bootstrap repository, meaning:

It can create foundational infrastructure such as:

Terraform state S3 bucket

DynamoDB lock table

KMS encryption key

GitHub OIDC IAM roles

Shared networking or org resources

Once bootstrapped, other Terraform repos can use the remote backend safely.

🔐 Security Best Practices

This template encourages:

Remote state storage

State locking

Least-privilege IAM

OIDC-based GitHub authentication

No hardcoded credentials

Pre-commit validation

📁 Suggested Repository Structure
.
├── .github/
│   └── workflows/
├── terraform/
│   ├── main.tf
│   ├── providers.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── backend.tf
├── .gitignore
├── .pre-commit-config.yaml
├── install-pre-commit.sh
└── README.md

🔄 Typical Workflow

Developer writes Terraform code

Pre-commit runs automatically

Code pushed to GitHub

GitHub Actions runs:

terraform fmt

terraform validate

terraform plan

Review plan

Apply via CI (optional)

🛠 Extending This Template

You can extend this template to include:

Environment folders (env/dev, env/prod)

Shared modules

Makefile commands

Terragrunt (if desired)

Policy as Code (OPA, Sentinel)

📌 When To Use This Template

Use this repository when:

Starting a new Terraform project

Standardising infrastructure repos across teams

Enforcing CI/CD from day one

Bootstrapping Terraform infrastructure safely

⚠️ Important Notes

Do not commit .tfstate files.

Always use remote state for team environments.

Do not reference variables or resources inside backend blocks.

Ensure CI uses the same Terraform version as local.

👥 Intended Audience

DevOps engineers

Platform teams

Cloud engineers

Infrastructure teams