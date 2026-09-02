resource "local_file" "ansible_inventory" {
  filename        = "../inventory.ini"
  file_permission = "0640"
  content         = <<-EOF
  [all]
  ${proxmox_vm_qemu.deploy-host[0].name} ansible_host=${proxmox_vm_qemu.deploy-host[0].default_ipv4_address}

  [all:vars]
  ansible_ssh_private_key_file=/your_link
  ansible_python_interpreter=/usr/bin/python3
  ansible_host_key_checking=False

EOF
}
