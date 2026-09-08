
module "lxc" {
  source   = "./modules/lxc"
  for_each = var.lxc_containers

  hostname          = each.value.hostname
  description       = each.value.description
  vm_id             = each.value.vm_id
  unpriviledged     = each.value.unpriviledged
  proxmox_node_name = each.value.proxmox_node_name

  start_on_boot      = each.value.start_on_boot
  network_interfaces = each.value.network_interfaces

  # Hardware spec
  storage = each.value.storage
  cpu     = each.value.cpu
  ram     = each.value.ram
  os      = each.value.os
}