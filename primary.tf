resource "hcloud_server" "primary" {
  name = "primary"
  datacenter    = "nbg1-dc3"
  server_type = "cx21"
  image = "debian-11"

  public_net {
    ipv4 = hcloud_primary_ip.primary_v4.id
    ipv6 = hcloud_primary_ip.primary_v6.id
  }

  ssh_keys = [hcloud_ssh_key.default.id]

  network {
    network_id = hcloud_network.internal.id
    ip         = "10.0.1.1"
  }

  depends_on = [
    hcloud_network_subnet.internal-subnet
  ]
}

resource "hcloud_primary_ip" "primary_v4" {
  type          = "ipv4"
  name          = "myip_v4"
  assignee_type = "server"
  datacenter    = "nbg1-dc3"
  auto_delete   = false
}

resource "hcloud_primary_ip" "primary_v6" {
  type          = "ipv6"
  name          = "myip_v6"
  assignee_type = "server"
  datacenter    = "nbg1-dc3"
  auto_delete   = false
}

output "primary_ip_v4" {
  description = "IP addr"
  value = hcloud_server.primary.ipv4_address
}
