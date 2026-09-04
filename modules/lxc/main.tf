resource "proxmox_virtual_environment_container" "debian_container" {
  description = var.description
  node_name   = var.proxmox_node_name
  vm_id       = var.vm_id

  unprivileged = true
  features {
    nesting = true
  }

  initialization {
    hostname = var.hostname

    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    user_account {
      keys = [
        trimspace(tls_private_key.debian_container_key.public_key_openssh)
      ]
      password = random_password.debian_container_password.result
    }
  }

  network_interface {
    name = "veth0"
  }

  cpu {
    architecture = var.cpu_architecture
    cores        = var.cpu_cores
  }

  disk {
    datastore_id = var.storage.datastore
    size         = var.storage.disk_size
  }

  operating_system {
    template_file_id = var.os.template_file
    type             = var.os.type
  }
  
  startup {
    order      = "3"
    up_delay   = "60"
    down_delay = "60"
  }
}

resource "random_password" "debian_container_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}

resource "tls_private_key" "debian_container_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

output "debian_container_password" {
  value     = random_password.debian_container_password.result
  sensitive = true
}

output "debian_container_private_key" {
  value     = tls_private_key.debian_container_key.private_key_pem
  sensitive = true
}

output "debian_container_public_key" {
  value = tls_private_key.debian_container_key.public_key_openssh
}