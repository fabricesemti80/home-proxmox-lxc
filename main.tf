resource "tls_private_key" "lxc_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key" {
  content         = tls_private_key.lxc_key.private_key_pem
  filename        = "${path.module}/lxc_private_key.pem"
  file_permission = "0600"
}

resource "local_file" "public_key" {
  content         = tls_private_key.lxc_key.public_key_openssh
  filename        = "${path.module}/lxc_public_key.pub"
  file_permission = "0644"
}

resource "proxmox_lxc" "containers" {
  for_each = local.containers

  target_node = each.value.target_node
  hostname    = each.value.hostname
  ostemplate  = each.value.ostemplate
  start       = true

  ssh_public_keys = tls_private_key.lxc_key.public_key_openssh

  unprivileged = true

  rootfs {
    storage = each.value.storage
    size    = each.value.size
  }

  network {
    name   = each.value.network.name
    bridge = each.value.network.bridge
    ip     = each.value.network.ip
    gw     = each.value.network.gw
  }
}
