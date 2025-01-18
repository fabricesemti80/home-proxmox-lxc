# Simple Proxmox LXC Container builds

This repo is meant to deploy a few LXC containers for my personal use.

## Requirements

- `direnv`
- `terraform`
- a `Proxmox` host (or cluster)

> note: the two CLI tools are deployed by the devcontainer provided within the repo

## Preparations

Other than the Proxmox deployment - which is by no means something I intend to cover here - the following steps requirted:

- create a dedicated account on Proxmox (you could use the default `root` account, but I don't recommend it); follow [this guide](https://austinsnerdythings.com/2021/09/01/how-to-deploy-vms-in-proxmox-with-terraform/) or some other Internet guide to create a user account and assign it the needed rights

- the created user's credentials should be loaded as env variables

```bash
# $ cat .envrc 
export TF_VAR_PM_API_TOKEN_ID=
export TF_VAR_PM_API_TOKEN_SECRET=
```

> note: I use `direnv` to load the env variables, but feel free to use your prefered method

- the Proxmox node(s) should also be resolvable by Terraform, therefore please ensure their DNS names are either in `/etc/hosts` or resolved by DNS

## Terraforming

Once these are prepared, the next step I recommend is to update the `locals.tf` to match the needs of your setup. If you are not me, there is a good chance you will use a different networking, and different container parameters.

Then, the standard Terraform commands executed in an order should bring the containers up and running:

```bash
vscode ➜ /workspaces/proxmox (main) $ terraform init --upgrade
Initializing the backend...
Initializing provider plugins...
- Finding latest version of telmate/proxmox...
- Finding hashicorp/tls versions matching "~> 4.0"...
- Finding latest version of hashicorp/local...
- Using previously-installed telmate/proxmox v2.9.14
- Using previously-installed hashicorp/tls v4.0.6
- Using previously-installed hashicorp/local v2.5.2

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
vscode ➜ /workspaces/proxmox (main) $ terraform plan -out containers.plan

Terraform used the selected providers to generate the following execution plan.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # local_file.private_key will be created
  + resource "local_file" "private_key" {
      + content              = (sensitive value)
      + content_base64sha256 = (known after apply)
      + content_base64sha512 = (known after apply)
      + content_md5          = (known after apply)
      + content_sha1         = (known after apply)
      + content_sha256       = (known after apply)
      + content_sha512       = (known after apply)
      + directory_permission = "0777"
      + file_permission      = "0600"
      + filename             = "./lxc_private_key.pem"
      + id                   = (known after apply)
    }

  # local_file.public_key will be created
  + resource "local_file" "public_key" {
      + content              = (known after apply)
      + content_base64sha256 = (known after apply)
      + content_base64sha512 = (known after apply)
      + content_md5          = (known after apply)
      + content_sha1         = (known after apply)
      + content_sha256       = (known after apply)
      + content_sha512       = (known after apply)
      + directory_permission = "0777"
      + file_permission      = "0644"
      + filename             = "./lxc_public_key.pub"
      + id                   = (known after apply)
    }

  # proxmox_lxc.containers["container0"] will be created
  + resource "proxmox_lxc" "containers" {
      + arch            = "amd64"
      + cmode           = "tty"
      + console         = true
      + cores           = 1
      + cpulimit        = 0
      + cpuunits        = 1024
      + hostname        = "lxc-basic-0"
      + id              = (known after apply)
      + memory          = 512
      + onboot          = false
      + ostemplate      = "nfs-qnap-proxmox:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
      + ostype          = (known after apply)
      + protection      = false
      + ssh_public_keys = (known after apply)
      + start           = true
      + swap            = 0
      + target_node     = "pve-0"
      + tty             = 2
      + unprivileged    = true
      + unused          = (known after apply)
      + vmid            = (known after apply)

      + network {
          + bridge = "vmbr0"
          + gw     = "10.0.40.1"
          + hwaddr = (known after apply)
          + ip     = "10.0.40.110/24"
          + name   = "eth0"
          + tag    = (known after apply)
          + trunks = (known after apply)
          + type   = (known after apply)
        }

      + rootfs {
          + size    = "16G"
          + storage = "cp"
          + volume  = (known after apply)
        }
    }

  # proxmox_lxc.containers["container1"] will be created
  + resource "proxmox_lxc" "containers" {
      + arch            = "amd64"
      + cmode           = "tty"
      + console         = true
      + cores           = 1
      + cpulimit        = 0
      + cpuunits        = 1024
      + hostname        = "lxc-basic-1"
      + id              = (known after apply)
      + memory          = 512
      + onboot          = false
      + ostemplate      = "nfs-qnap-proxmox:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
      + ostype          = (known after apply)
      + protection      = false
      + ssh_public_keys = (known after apply)
      + start           = true
      + swap            = 0
      + target_node     = "pve-1"
      + tty             = 2
      + unprivileged    = true
      + unused          = (known after apply)
      + vmid            = (known after apply)

      + network {
          + bridge = "vmbr0"
          + gw     = "10.0.40.1"
          + hwaddr = (known after apply)
          + ip     = "10.0.40.111/24"
          + name   = "eth0"
          + tag    = (known after apply)
          + trunks = (known after apply)
          + type   = (known after apply)
        }

      + rootfs {
          + size    = "16G"
          + storage = "local-lvm"
          + volume  = (known after apply)
        }
    }

  # proxmox_lxc.containers["container2"] will be created
  + resource "proxmox_lxc" "containers" {
      + arch            = "amd64"
      + cmode           = "tty"
      + console         = true
      + cores           = 1
      + cpulimit        = 0
      + cpuunits        = 1024
      + hostname        = "lxc-basic-2"
      + id              = (known after apply)
      + memory          = 512
      + onboot          = false
      + ostemplate      = "nfs-qnap-proxmox:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
      + ostype          = (known after apply)
      + protection      = false
      + ssh_public_keys = (known after apply)
      + start           = true
      + swap            = 0
      + target_node     = "pve-0"
      + tty             = 2
      + unprivileged    = true
      + unused          = (known after apply)
      + vmid            = (known after apply)

      + network {
          + bridge = "vmbr0"
          + gw     = "10.0.40.1"
          + hwaddr = (known after apply)
          + ip     = "10.0.40.112/24"
          + name   = "eth0"
          + tag    = (known after apply)
          + trunks = (known after apply)
          + type   = (known after apply)
        }

      + rootfs {
          + size    = "16G"
          + storage = "cp"
          + volume  = (known after apply)
        }
    }

  # tls_private_key.lxc_key will be created
  + resource "tls_private_key" "lxc_key" {
      + algorithm                     = "RSA"
      + ecdsa_curve                   = "P224"
      + id                            = (known after apply)
      + private_key_openssh           = (sensitive value)
      + private_key_pem               = (sensitive value)
      + private_key_pem_pkcs8         = (sensitive value)
      + public_key_fingerprint_md5    = (known after apply)
      + public_key_fingerprint_sha256 = (known after apply)
      + public_key_openssh            = (known after apply)
      + public_key_pem                = (known after apply)
      + rsa_bits                      = 4096
    }

Plan: 6 to add, 0 to change, 0 to destroy.

──────────────────────────────────────────────────────────────────────────────────────

Saved the plan to: containers.plan

To perform exactly these actions, run the following command to apply:
    terraform apply "containers.plan"
vscode ➜ /workspaces/proxmox (main) $ terraform apply containers.plan 
tls_private_key.lxc_key: Creating...
tls_private_key.lxc_key: Creation complete after 2s [id=327ae6c5fb88e9c671951ef73909275c5e226a40]
proxmox_lxc.containers["container0"]: Creating...
proxmox_lxc.containers["container2"]: Creating...
local_file.public_key: Creating...
local_file.private_key: Creating...
proxmox_lxc.containers["container1"]: Creating...
local_file.public_key: Creation complete after 0s [id=d3754d92eeb4adb19af9d81248e5383b67d30aba]
local_file.private_key: Creation complete after 0s [id=f326ee46bcd5bc25ce5b263f93144955c41a01f0]
proxmox_lxc.containers["container1"]: Creation complete after 4s [id=pve-1/lxc/104]
proxmox_lxc.containers["container2"]: Still creating... [10s elapsed]
proxmox_lxc.containers["container0"]: Still creating... [10s elapsed]
proxmox_lxc.containers["container0"]: Still creating... [20s elapsed]
proxmox_lxc.containers["container2"]: Still creating... [20s elapsed]
proxmox_lxc.containers["container2"]: Still creating... [30s elapsed]
proxmox_lxc.containers["container0"]: Still creating... [30s elapsed]
proxmox_lxc.containers["container0"]: Creation complete after 34s [id=pve-0/lxc/103]
proxmox_lxc.containers["container2"]: Creation complete after 36s [id=pve-0/lxc/101]

Apply complete! Resources: 6 added, 0 changed, 0 destroyed.
vscode ➜ /workspaces/proxmox (main) $ 
```

## Connect to the containers

As the keys needed for the connection to the containers are conveniently stored in the folder, you should be able to connect to the containers via SSH.

```bash
ssh root@10.0.40.111 -i lxc_private_key.pem 
The authenticity of host '10.0.40.111 (10.0.40.111)' can't be established.
ED25519 key fingerprint is SHA256:bCuCFKfc9BCJ8DxWpw1WQmymLGF4+2mD3VnXrXBYAkk.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '10.0.40.111' (ED25519) to the list of known hosts.
Welcome to Ubuntu 22.04 LTS (GNU/Linux 6.8.4-3-pve x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

root@lxc-basic-1:~#
```