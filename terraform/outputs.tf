output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "public_ip_address" {
  description = "Public IP address of the VM"
  value       = azurerm_linux_virtual_machine.vm.public_ip_address
}

output "ssh_connection_string" {
  value = "ssh -i ${var.ssh_public_key_path} ${var.vm_admin_username}@${azurerm_linux_virtual_machine.vm.public_ip_address}"
}