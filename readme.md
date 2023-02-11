# personal infra project

## prerequisites 

1. terraform
1. pipenv (for ansible)
1. hetzner cloud API key
1. gopass (for API secret)

## Infra structure

`todo`

## example output

```
~/c/infra ❯❯❯ make apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # hcloud_network.internal will be created
  + resource "hcloud_network" "internal" {
      + delete_protection = false
      + id                = (known after apply)
      + ip_range          = "10.0.0.0/16"
      + name              = "internal"
    }

  # hcloud_network_subnet.internal-subnet will be created
  + resource "hcloud_network_subnet" "internal-subnet" {
      + gateway      = (known after apply)
      + id           = (known after apply)
      + ip_range     = "10.0.0.0/22"
      + network_id   = (known after apply)
      + network_zone = "eu-central"
      + type         = "cloud"
    }

  # hcloud_primary_ip.primary_v4 will be created
  + resource "hcloud_primary_ip" "primary_v4" {
      + assignee_id       = (known after apply)
      + assignee_type     = "server"
      + auto_delete       = false
      + datacenter        = "nbg1-dc3"
      + delete_protection = false
      + id                = (known after apply)
      + ip_address        = (known after apply)
      + ip_network        = (known after apply)
      + name              = "myip_v4"
      + type              = "ipv4"
    }

  # hcloud_primary_ip.primary_v6 will be created
  + resource "hcloud_primary_ip" "primary_v6" {
      + assignee_id       = (known after apply)
      + assignee_type     = "server"
      + auto_delete       = false
      + datacenter        = "nbg1-dc3"
      + delete_protection = false
      + id                = (known after apply)
      + ip_address        = (known after apply)
      + ip_network        = (known after apply)
      + name              = "myip_v6"
      + type              = "ipv6"
    }

  # hcloud_server.node-1 will be created
  + resource "hcloud_server" "node-1" {
      + allow_deprecated_images    = false
      + backup_window              = (known after apply)
      + backups                    = false
      + datacenter                 = "nbg1-dc3"
      + delete_protection          = false
      + firewall_ids               = (known after apply)
      + id                         = (known after apply)
      + ignore_remote_firewall_ids = false
      + image                      = "debian-11"
      + ipv4_address               = (known after apply)
      + ipv6_address               = (known after apply)
      + ipv6_network               = (known after apply)
      + keep_disk                  = false
      + location                   = (known after apply)
      + name                       = "node-1"
      + rebuild_protection         = false
      + server_type                = "cx21"
      + ssh_keys                   = (known after apply)
      + status                     = (known after apply)

      + network {
          + alias_ips   = (known after apply)
          + ip          = "10.0.2.1"
          + mac_address = (known after apply)
          + network_id  = (known after apply)
        }

      + public_net {
          + ipv4         = (known after apply)
          + ipv4_enabled = false
          + ipv6         = (known after apply)
          + ipv6_enabled = false
        }
    }

  # hcloud_server.node-2 will be created
  + resource "hcloud_server" "node-2" {
      + allow_deprecated_images    = false
      + backup_window              = (known after apply)
      + backups                    = false
      + datacenter                 = "nbg1-dc3"
      + delete_protection          = false
      + firewall_ids               = (known after apply)
      + id                         = (known after apply)
      + ignore_remote_firewall_ids = false
      + image                      = "debian-11"
      + ipv4_address               = (known after apply)
      + ipv6_address               = (known after apply)
      + ipv6_network               = (known after apply)
      + keep_disk                  = false
      + location                   = (known after apply)
      + name                       = "node-2"
      + rebuild_protection         = false
      + server_type                = "cx21"
      + ssh_keys                   = (known after apply)
      + status                     = (known after apply)

      + network {
          + alias_ips   = (known after apply)
          + ip          = "10.0.2.2"
          + mac_address = (known after apply)
          + network_id  = (known after apply)
        }

      + public_net {
          + ipv4         = (known after apply)
          + ipv4_enabled = false
          + ipv6         = (known after apply)
          + ipv6_enabled = false
        }
    }

  # hcloud_server.primary will be created
  + resource "hcloud_server" "primary" {
      + allow_deprecated_images    = false
      + backup_window              = (known after apply)
      + backups                    = false
      + datacenter                 = "nbg1-dc3"
      + delete_protection          = false
      + firewall_ids               = (known after apply)
      + id                         = (known after apply)
      + ignore_remote_firewall_ids = false
      + image                      = "debian-11"
      + ipv4_address               = (known after apply)
      + ipv6_address               = (known after apply)
      + ipv6_network               = (known after apply)
      + keep_disk                  = false
      + location                   = (known after apply)
      + name                       = "primary"
      + rebuild_protection         = false
      + server_type                = "cx21"
      + ssh_keys                   = (known after apply)
      + status                     = (known after apply)

      + network {
          + alias_ips   = (known after apply)
          + ip          = "10.0.1.1"
          + mac_address = (known after apply)
          + network_id  = (known after apply)
        }

      + public_net {
          + ipv4         = (known after apply)
          + ipv4_enabled = true
          + ipv6         = (known after apply)
          + ipv6_enabled = true
        }
    }

  # hcloud_ssh_key.default will be created
  + resource "hcloud_ssh_key" "default" {
      + fingerprint = (known after apply)
      + id          = (known after apply)
      + name        = "default key"
      + public_key  = <<-EOT
            ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDARNhzTBZTv4bilEXoi++HPhzdMI25vLTOXkK8N1BvJ9474yMzVp6bZqzheLWvDX9R+V7IZ2aAhyUZGUppBUyLU5O1BFX5yj43eS1N1tFrUet9u/Jdond0W/B++l5Z7J3xFJJ58pnTG3Ls35tesON9az3WUJbbh6jvEXJwrz0zFkjg+WdwqrqCyhW8T+BezfQ3jCjp6/jTY+Gn4YxEBdw8CexEdfUqhIx77f4PjI7mTVrs0D0KtxQNFEEIhITNgD/96VF+Se9E/DOXpOg+BNJ0pkEu4/aua/5cu7Hc6Da5HlQE3zLR2uTJBj2lVcXtJeYxsCapM0R0ZzhhVUrVP+uboePTjwxY5iBLBhqOG1nAK3qtRM6q347kQIM9xDHnh2lu4xFG6GCI+zjdh6OW+q087Ax9xePs1CGNgC9aVS52425Z/7aKlZPEasDa0DbeR3oYU8wyryk52cbpJlsH7EPFgAAMJX2KQkhY38ZbYjIxReMCwkcosuV6Y9W1HpvD6MNbD94Vk8/CbfIQA4K/hX/EMHTzCIuGWoZDNWMGUeWA8t7NK13F8YdrHUeeSv14loS5LNURR4kv173PPc9NeV4q/4zeCCbb5FUKG4OasF7WFduzc6zmj+NPziDykZ7kBzOMk+ZYxy/InPe4YwcaL64qfmLKs1Wl7FOilJoO0/BLNw== modin@nitrogen
        EOT
    }

Plan: 8 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + primary_ip_v4 = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

hcloud_ssh_key.default: Creating...
hcloud_primary_ip.primary_v6: Creating...
hcloud_network.internal: Creating...
hcloud_primary_ip.primary_v4: Creating...
hcloud_primary_ip.primary_v4: Creation complete after 0s [id=22493690]
hcloud_primary_ip.primary_v6: Creation complete after 0s [id=22493691]
hcloud_network.internal: Creation complete after 0s [id=2514153]
hcloud_network_subnet.internal-subnet: Creating...
hcloud_ssh_key.default: Creation complete after 0s [id=10124208]
hcloud_network_subnet.internal-subnet: Creation complete after 2s [id=2514153-10.0.0.0/22]
hcloud_server.node-2: Creating...
hcloud_server.node-1: Creating...
hcloud_server.primary: Creating...
hcloud_server.node-2: Still creating... [10s elapsed]
hcloud_server.primary: Still creating... [10s elapsed]
hcloud_server.node-1: Still creating... [10s elapsed]
hcloud_server.node-2: Still creating... [20s elapsed]
hcloud_server.node-1: Still creating... [20s elapsed]
hcloud_server.primary: Still creating... [20s elapsed]
hcloud_server.node-2: Creation complete after 23s [id=28753117]
hcloud_server.primary: Provisioning with 'local-exec'...
hcloud_server.primary (local-exec): Executing: ["/bin/sh" "-c" "ANSIBLE_HOST_KEY_CHECKING=False pipenv run ansible-playbook -u root -i '78.47.244.214,' ansible/postgres.yml"]
hcloud_server.node-1: Creation complete after 24s [id=28753119]

hcloud_server.primary (local-exec): PLAY [psql configuration] ******************************************************

hcloud_server.primary (local-exec): TASK [Wait 600 seconds for target connection to become reachable/usable] *******
hcloud_server.primary: Still creating... [30s elapsed]
hcloud_server.primary (local-exec): ok: [78.47.244.214]

hcloud_server.primary (local-exec): TASK [Gather facts for first time] *********************************************
hcloud_server.primary (local-exec): ok: [78.47.244.214]

hcloud_server.primary (local-exec): TASK [Install postgresql] ******************************************************
hcloud_server.primary: Still creating... [40s elapsed]
hcloud_server.primary: Still creating... [50s elapsed]
hcloud_server.primary: Still creating... [1m0s elapsed]
hcloud_server.primary (local-exec): changed: [78.47.244.214]

hcloud_server.primary (local-exec): TASK [Find out if PostgreSQL is initialized] ***********************************
hcloud_server.primary (local-exec): ok: [78.47.244.214]

hcloud_server.primary (local-exec): PLAY RECAP *********************************************************************
hcloud_server.primary (local-exec): 78.47.244.214              : ok=4    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

hcloud_server.primary: Creation complete after 1m9s [id=28753118]

Apply complete! Resources: 8 added, 0 changed, 0 destroyed.

Outputs:

primary_ip_v4 = "78.47.244.214"
```
