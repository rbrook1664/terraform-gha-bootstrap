🚀 Terraform Bootstrap Template

A production-ready Terraform starter repository for spinning up new infrastructure repos quickly, securely, and consistently.

✨ What You Get

✅ GitHub Actions CI pipeline

✅ Pre-commit hooks enforced

✅ Clean Terraform project structure

✅ Remote state ready pattern

✅ Secure-by-default approach

✅ Opinionated best practices

📦 Repository Structure
.
├── .github/
├── terraform/
├── .gitignore
├── .pre-commit-config.yaml
├── install-pre-commit.sh
└── README.md

🧱 Repository Components
<details> <summary><strong>📂 .github/ — CI/CD Workflows</strong></summary>
Includes

Terraform fmt

Terraform validate

Terraform plan

Optional apply

OIDC-ready configuration

Why It Matters

Prevents broken Terraform from merging

Enforces formatting consistency

Allows safe, reviewable infrastructure changes

Eliminates manual CLI drift

</details>
<details> <summary><strong>📂 terraform/ — Infrastructure Code</strong></summary>

This is where your actual infrastructure lives.

Standard Files

main.tf → Core resources

providers.tf → Provider configuration

variables.tf → Input variables

outputs.tf → Outputs

backend.tf (optional) → Remote state configuration

Recommended Pattern

Use remote state:

terraform {
  backend "s3" {
    bucket         = "my-tfstate-bucket"
    key            = "env/dev/terraform.tfstate"
    region         = "eu-west-2"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}


⚠️ Do not use variables inside backend blocks.

</details>
<details> <summary><strong>🧹 .pre-commit-config.yaml — Code Quality Enforcement</strong></summary>

Automatically runs before every commit:

terraform fmt

terraform validate

tflint

YAML linting

Trailing whitespace removal

EOF fixing

Install
./install-pre-commit.sh


Prevents broken code from ever reaching CI.

</details>
<details> <summary><strong>🚫 .gitignore — Safe Defaults</strong></summary>

Prevents committing:

.terraform/

*.tfstate

*.tfstate.backup

Sensitive files

Local override files

Never commit Terraform state.

</details>
⚡ Quick Start
<details> <summary><strong>1️⃣ Clone the Template</strong></summary>
git clone <this-repo> my-new-infra
cd my-new-infra

</details>
<details> <summary><strong>2️⃣ Install Pre-Commit Hooks</strong></summary>
chmod +x install-pre-commit.sh
./install-pre-commit.sh

</details>
<details> <summary><strong>3️⃣ Initialise Terraform</strong></summary>
cd terraform
terraform init
terraform fmt
terraform validate

</details>
🏗 Bootstrap Mode (Optional)

This template can also act as a bootstrap repository.

<details> <summary><strong>What Does Bootstrap Mean?</strong></summary>

Bootstrapping means creating the infrastructure Terraform itself depends on:

S3 state bucket

DynamoDB lock table

KMS key

GitHub OIDC IAM roles

Shared networking

You run bootstrap once.

Then all other Terraform repos use that remote state safely.

</details>
🔐 Security Principles

Remote state required for teams

No hardcoded credentials

OIDC preferred over static IAM keys

Enforced formatting & validation

Locking recommended (DynamoDB)

🔄 Typical Developer Workflow
<details> <summary><strong>Day-to-Day Flow</strong></summary>

Write Terraform

Pre-commit runs automatically

Push to GitHub

CI runs fmt, validate, plan

Review plan output

Merge and apply (if enabled)

Safe. Repeatable. Predictable.

</details>
🧠 When To Use This Template

New service infrastructure repo

Environment repo (dev/test/prod)

Bootstrap infra repo

Platform team standardisation

Terraform onboarding

📈 Recommended Evolution

As your infra matures, consider adding:

Environment folders (env/dev, env/prod)

Shared modules repo

Policy as Code

Cost estimation checks

Security scanning

Drift detection

🎯 Design Philosophy

This template is:

Opinionated but flexible

Minimal but production-ready

CI-first

Security-aware

Team-friendly 