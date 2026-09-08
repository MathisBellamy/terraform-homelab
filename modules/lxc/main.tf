resource "proxmox_virtual_environment_container" "lxc_container" {
  description = var.description
  node_name   = var.proxmox_node_name
  vm_id       = var.vm_id

  unprivileged = var.unpriviledged

  features {
    nesting = true
  }

  initialization {
    hostname = var.hostname

    dynamic "ip_config" {
      for_each = var.network_interfaces

      content {
        ipv4 {
          address = ip_config.value.ipv4_address
          gateway = ip_config.value.ipv4_gateway
        }
        ipv6 {
          address = ip_config.value.ipv6_address
          gateway = ip_config.value.ipv6_gateway
        }
      }
    }

    # user_account {
    #   keys = [
    #     trimspace(tls_private_key.lxc_container_key.public_key_openssh)
    #   ]
    #   password = random_password.lxc_container_password.result
    # }
  }

  dynamic "network_interface" {
    for_each = var.network_interfaces

    content {
      name    = network_interface.key
      bridge  = network_interface.value.bridge
      vlan_id = network_interface.value.vlan_id
      firewall = network_interface.value.firewall
    }
  }

  cpu {
    architecture = var.cpu.architecture
    cores        = var.cpu.cores
  }

  memory {
    dedicated = var.ram.size
    swap      = var.ram.swap
  }

  disk {
    datastore_id = var.storage.datastore
    size         = var.storage.disk_size
    path_in_datastore = var.storage.path_in_datastore
  }

  operating_system {
    template_file_id = var.os.template_file
    type             = var.os.type
  }

  start_on_boot = var.start_on_boot
}

# resource "random_password" "lxc_container_password" {
#   length           = 50
#   override_special = "_%@"
#   special          = true
# }

# resource "tls_private_key" "lxc_container_key" {
#   algorithm = "ED25519"
# }

# output "lxc_container_password" {
#   value     = random_password.lxc_container_password.result
#   sensitive = true
# }

# output "lxc_container_private_key" {
#   value     = tls_private_key.lxc_container_key.private_key_pem
#   sensitive = true
# }

# output "lxc_container_public_key" {
#   value = tls_private_key.lxc_container_key.public_key_openssh
# }