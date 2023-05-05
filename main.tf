terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.38.2"
    }
    rke = {
      source = "rancher/rke"
      version = "1.3.4"
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
