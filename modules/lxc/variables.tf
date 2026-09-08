
variable "hostname" {
  type = string
}

variable "description" {
  type = string
}

variable "vm_id" {
  type = string
}

variable "proxmox_node_name" {
  type = string
}

variable "unpriviledged" {
  type = bool
}

variable "start_on_boot" {
  type = bool
}

# Network

variable "network_interfaces" {
  type = map(object({
    ipv4_address = string
    ipv4_gateway = string
    ipv6_address = string
    ipv6_gateway = string
    bridge       = string
    vlan_id      = string
    firewall = bool
  }))
}


# Storage & Disk

variable "storage" {
  type = map(string)
}

# CPU

variable "cpu" {
  type = map(string)
}

# RAM

variable "ram" {
  type = map(string)
}

# OS

variable "os" {
  type = map(string)
}
