terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.36.2"
    }
  }
}

provider "hcloud" {
  # Configuration options
  token = var.hcloud_token
}

resource "hcloud_ssh_key" "default" {
  name       = "default key"
  public_key = file("~/.ssh/id_rsa.pub")
}
