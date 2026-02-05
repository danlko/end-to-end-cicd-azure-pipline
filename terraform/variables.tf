variable "resource_group_name" {
  default = "rg-project-dev-2"
}

variable "location" {
  default = "westeurope"
}

variable "vm_admin_username" {
  default = "azureuser"
}

variable "ssh_public_key_path" {
  default     = "~/.ssh/id_rsa.pub" 
}