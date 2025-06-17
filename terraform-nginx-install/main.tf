terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

provider "null" {}

resource "null_resource" "install_nginx" {
  provisioner "local-exec" {
    command = <<EOT
      sudo apt-get update -y
      sudo apt-get install nginx -y
    EOT
  }
}