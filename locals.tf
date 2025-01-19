locals {
  containers = {
    "container0" = {

      target_node = "pve-0"
      hostname    = "docker-swarmhost-0"
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
    "container1" = {

      target_node = "pve-1"
      hostname    = "docker-swarmhost-1"
      ostemplate  = "nfs-qnap-proxmox:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
      storage     = "local-lvm"
      size        = "16G"
      network = {
        name   = "eth0"
        bridge = "vmbr0"
        ip     = "10.0.40.111/24"
        gw     = "10.0.40.1"
      }
    },
    "container2" = {

      target_node = "pve-0"
      hostname    = "docker-swarmhost-2"
      ostemplate  = "nfs-qnap-proxmox:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
      storage     = "cp"
      size        = "16G"
      network = {
        name   = "eth0"
        bridge = "vmbr0"
        ip     = "10.0.40.112/24"
        gw     = "10.0.40.1"
      }
    }
  }
}
