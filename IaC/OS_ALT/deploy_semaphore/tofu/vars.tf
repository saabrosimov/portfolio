variable "storage_name" {
  type = string
}

variable "proxmox_api_url" {
  type = string
}

variable "proxmox_api_token_id" {
  type      = string
  sensitive = true
}

variable "proxmox_api_token_secret" {
  type      = string
  sensitive = true
}

variable "ssh_key" {
  description = "The public SSH key to install on new VMs."
  default     = ""
}

variable "deploy-host" {
  default = "4096"
}

