
api_token = "terraform-prov@pve!terraform=72fcee44-2fc6-4220-9e51-38c4712f2740"

lxc_containers = {
  # wireguard = {
  #   hostname    = "wireguard"
  #   description = "To host wireguard server"
  #   vm_id       = 101
  #   storage = {
  #     datastore = "local-lvm"
  #     disk_size = 8
  #     # path_in_datastore = "local-lvm:vm-101-disk-0"
  #   }
  #   cpu = {
  #     cores = 1
  #   }
  #   ram = {
  #     size = 512
  #     swap = 512
  #   }
  #   os = {
  #     type          = "debian"
  #     template_file = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
  #   }

  #   network_interfaces = {
  #     eth0 = {
  #       bridge       = "vmbr0"
  #       ipv4_address = "192.168.1.31/24"
  #       ipv4_gateway = "192.168.1.1"
  #       ipv6_address = "2a02:8424:6fe3:901::31/64"
  #       ipv6_gateway = "fe80::1"
  #       firewall = true
  #     }
  #   }
  # }
  #  vaultwarden = {
  #   hostname    = "vaultwarden"
  #   description = "To host vaultwarden server"
  #   vm_id       = 102
  #   storage = {
  #     datastore = "local-lvm"
  #     disk_size = 8
  #     # path_in_datastore = "local-lvm:vm-102-disk-0"
  #   }
  #   cpu = {
  #     cores = 1
  #   }
  #   ram = {
  #     size = 512
  #     swap = 512
  #   }
  #   os = {
  #     type          = "debian"
  #     template_file = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
  #   }

  #   network_interfaces = {
  #     eth0 = {
  #       bridge       = "vmbr0"
  #       ipv4_address = "192.168.1.32/24"
  #       ipv4_gateway = "192.168.1.1"
  #       firewall = true
  #     }
  #   }
  # }
  test_vm = {
    hostname    = "test_vm"
    description = "To host test_vm server"
    vm_id       = 1000
    storage = {
      datastore = "local-lvm"
      disk_size = 8
      # path_in_datastore = "local-lvm:vm-102-disk-0"
    }
    cpu = {
      cores = 1
    }
    ram = {
      size = 512
      swap = 512
    }
    os = {
      type          = "debian"
      template_file = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
    }

    network_interfaces = {
      eth0 = {
        bridge       = "vmbr0"
        ipv4_address = "192.168.1.100/24"
        ipv4_gateway = "192.168.1.1"
        firewall = true
      }
    }
  }
}