resource "proxmox_vm_qemu" "deploy-host" {
  count       = 1
  name        = "deploy-host-${count.index + 0}"
  description = "Managed by OpenTofu."
  tags        = "test"

  # Node name has to be the same name as within the cluster
  # this might not include the FQDN
  target_node = "pve-03"

  # The destination resource pool for the new VM

  # The template name to clone this vm from
  clone = "name-template"

  # Activate QEMU agent for this VM
  agent = 1

  os_type = "cloud-init"

  cpu {
    cores   = 2
    sockets = 2
  }

  memory = var.deploy-host

  # Setup the disk
  disks {
    ide {
      ide2 {
        cloudinit {
          storage = var.storage_name
        }
      }
    }
    virtio {
      virtio0 {
        disk {
          size    = "100G"
          storage = var.storage_name
        }
      }
    }
  }

  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }

  # Setup the ip address using cloud-init.
  boot       = "order=virtio0"
  ipconfig0  = "ip=dhcp"
  nameserver = "0.0.0.0"
  ciuser     = "youruser"
  sshkeys    = var.ssh_key
}

output "manager_vm_ip_address" {
  value = [proxmox_vm_qemu.deploy-host.*.default_ipv4_address]
}
