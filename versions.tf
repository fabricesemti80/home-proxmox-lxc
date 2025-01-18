terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"

    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}
