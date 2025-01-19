locals {
  containers = {
    "swarm-m0" = {

      target_node = "pve-0"
      hostname    = "swarm-m0"
      ostemplate  = "nfs-qnap-proxmox:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
      storage     = "cp"
      size        = "16G"
      network = {
        name   = "eth0"
        bridge = "vmbr0"
        ip     = "10.0.40.110/24"
        gw     = "10.0.40.1"
      }
    },
    "swarm-w0" = {

      target_node = "pve-1"
      hostname    = "swarm-w0"
      ostemplate  = "nfs-qnap-proxmox:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
      storage     = "local-lvm"
      size        = "16G"
      network = {
        name   = "eth0"
        bridge = "vmbr0"
        ip     = "10.0.40.120/24"
        gw     = "10.0.40.1"
      }
    },
    "swarm-w1" = {

      target_node = "pve-0"
      hostname    = "swarm-w0"
      ostemplate  = "nfs-qnap-proxmox:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
      storage     = "cp"
      size        = "16G"
      network = {
        name   = "eth0"
        bridge = "vmbr0"
        ip     = "10.0.40.121/24"
        gw     = "10.0.40.1"
      }
    }
  }
}
