resource "hcloud_server" "node" {
  count = var.node_count

  name = "node-${count.index}"
  datacenter    = "nbg1-dc3"
  server_type = "cx21"
  image = "debian-11"
  ssh_keys = [hcloud_ssh_key.default.id]

  network {
    network_id = hcloud_network.nat_network.id
    ip         = "10.0.0.${sum([3, count.index])}" # 3 is first available
  }

  public_net {
    ipv4_enabled = false
    ipv6_enabled = false
  }

  user_data = file("${path.module}/user_data-node.yaml")

  depends_on = [
    hcloud_network_subnet.nat_network,
    hcloud_server.primary
  ]

  provisioner "remote-exec" {
    inline = [
      "cloud-init status --wait --long"
    ]

    connection {
      host = var.primary_internal_ip
      private_key = file("~/.ssh/id_rsa")

      bastion_host = hcloud_server.primary.ipv4_address
      bastion_private_key = file("~/.ssh/id_rsa")
    }
  }
}
