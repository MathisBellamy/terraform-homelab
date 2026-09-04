terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.112.0"
    }
  }
}

provider "proxmox" {
  endpoint  = "https://pve.mattzoo.lab:8006/"
  api_token = var.api_token
  insecure  = true
}