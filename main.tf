terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.1"
    }
  }
  required_version = ">= 1.0.0"
}

provider "local" {}

resource "local_file" "example" {
  count    = length(var.filenames)
  filename = var.filenames[count.index]
  content  = var.content
}
