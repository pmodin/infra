resource "hcloud_server" "node-1" {
  name = "node-1"
  datacenter    = "nbg1-dc3"
  server_type = "cx21"
  image = "debian-11"
  ssh_keys = [hcloud_ssh_key.default.id]

  network {
    network_id = hcloud_network.nat-network.id
    ip         = "10.0.0.3"
  }

  public_net {
    ipv4_enabled = false
    ipv6_enabled = false
  }

  user_data = file("${path.module}/user_data-node.yaml")

  depends_on = [
    hcloud_network_subnet.nat-network,
    hcloud_server.primary
  ]

  provisioner "remote-exec" {
    inline = [
      "cloud-init status --wait --long"
    ]

    connection {
      host = "10.0.0.3"
      private_key = file("~/.ssh/id_rsa")

      bastion_host = hcloud_server.primary.ipv4_address
      bastion_private_key = file("~/.ssh/id_rsa")
    }
  }
}

resource "hcloud_server" "node-2" {
  name = "node-2"
  datacenter    = "nbg1-dc3"
  server_type = "cx21"
  image = "debian-11"
  ssh_keys = [hcloud_ssh_key.default.id]

  network {
    network_id = hcloud_network.nat-network.id
    ip         = "10.0.0.4"
  }

  public_net {
    ipv4_enabled = false
    ipv6_enabled = false
  }

  user_data = file("${path.module}/user_data-node.yaml")

  depends_on = [
    hcloud_network_subnet.nat-network,
    hcloud_server.primary
  ]

  provisioner "remote-exec" {
    inline = [
      "cloud-init status --wait --long"
    ]

    connection {
      host = "10.0.0.4"
      private_key = file("~/.ssh/id_rsa")

      bastion_host = hcloud_server.primary.ipv4_address
      bastion_private_key = file("~/.ssh/id_rsa")
    }
  }
}
