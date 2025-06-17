#!/bin/bash

# Eenmalige setup voor een nieuwe Terraform repo
echo "[✔] Initialiseren van nieuwe Terraform Git repo"

# Voeg .gitignore toe
cat > .gitignore <<EOF
# Terraform-bestanden die je niet wil tracken
.terraform/
*.tfstate
*.tfstate.*
.terraform.lock.hcl
terraform.tfvars
EOF

# Git setup
git init
git add .
git commit -m "Initial commit met Terraform config"
git branch -M main
git remote add origin https://github.com/walid-riani/terraform-homelab.git
git pull --rebase origin main
git push -u origin main

echo "[✔] Repo succesvol gepusht!"
