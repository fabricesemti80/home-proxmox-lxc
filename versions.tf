terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "~> 2.9"

    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}
