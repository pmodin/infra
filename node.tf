resource "hcloud_server" "node-1" {
  name = "node-1"
  datacenter    = "nbg1-dc3"
  server_type = "cx21"
  image = "debian-11"
  ssh_keys = [hcloud_ssh_key.default.id]

  network {
    network_id = hcloud_network.internal.id
    ip         = "10.0.2.1"
  }

  public_net {
    ipv4_enabled = false
    ipv6_enabled = false
  }

  depends_on = [
    hcloud_network_subnet.internal-subnet
  ]
}

resource "hcloud_server" "node-2" {
  name = "node-2"
  datacenter    = "nbg1-dc3"
  server_type = "cx21"
  image = "debian-11"
  ssh_keys = [hcloud_ssh_key.default.id]

  network {
    network_id = hcloud_network.internal.id
    ip         = "10.0.2.2"
  }

  public_net {
    ipv4_enabled = false
    ipv6_enabled = false
  }

  depends_on = [
    hcloud_network_subnet.internal-subnet
  ]
}
