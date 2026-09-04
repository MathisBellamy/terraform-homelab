
variable "hostname" {
  type = string
}

variable "description" {
  type = string
}

variable "vm_id" {
  type = string
}

variable "node_name" {
  type    = string
  default = "pve"
}

# Storage & Disk

variable "storage" {
    type = map(string)
    default = {
        datastore = "local-lvm"
        disk_size = "2" # in GiB
    }
}

# CPU

variable "cpu" {
  type = map(string)
  default = {
    architecture = "amd64"
    cores        = "1"
  }
}

# RAM

variable "ram" {
  type = map(string)
  default = {
    size = "512" # in Mb
    swap = "0"   # in Mb
  }
}

# OS

variable "os" {
    type = map(string)
    default = {
        type = "debian"
        template_file = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
    }
}