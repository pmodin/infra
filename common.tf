resource "hcloud_network" "internal" {
  name     = "internal"
  ip_range = "10.0.0.0/16"
}

resource "hcloud_network_subnet" "internal-subnet" {
  type         = "cloud"
  network_id   = hcloud_network.internal.id
  network_zone = "eu-central"
  ip_range     = "10.0.0.0/22"

  depends_on = [
    hcloud_network.internal
  ]
}
