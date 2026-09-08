variable "api_token" {
  type      = string
  sensitive = true
}

variable "lxc_containers" {
  type = map(object({
    hostname      = string
    description   = string
    vm_id         = number
    unpriviledged = optional(bool, true)

    proxmox_node_name = optional(string, "pve")
    storage = object({
      datastore = optional(string, "local-lvm")
      disk_size = optional(number, 2)
      path_in_datastore = optional(string, null)
    })

    cpu = object({
      architecture = optional(string, "amd64")
      cores        = optional(number, 1)
    })

    ram = object({
      size = optional(number, 512)
      swap = optional(number, 0)
    })

    os = object({
      type          = optional(string, "debian")
      template_file = optional(string, "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst")
    })

    network_interfaces = map(object({
      ipv4_address = string
      ipv4_gateway = optional(string, null)
      ipv6_address = optional(string, null)
      ipv6_gateway = optional(string, null)
      bridge       = optional(string, "vmbr0")
      vlan_id      = optional(string, null)
      firewall = optional(bool, true)
    }))

    start_on_boot = optional(bool, true)
  }))
}