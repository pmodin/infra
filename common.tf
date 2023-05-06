resource "hcloud_network" "nat_network" {
  name     = "nat-network"
  ip_range = "10.0.0.0/16"
}

resource "hcloud_network_subnet" "nat_network" {
  type         = "server"
  network_id   = hcloud_network.nat_network.id
  network_zone = "eu-central"
  ip_range     = "10.0.0.0/24"

  depends_on = [
    hcloud_network.nat_network
  ]
}

resource "hcloud_network_route" "outgoing" {
  network_id = hcloud_network.nat_network.id
  destination = "0.0.0.0/0"
  gateway = "10.0.0.2"

  depends_on = [
    hcloud_server.primary
  ]
}
