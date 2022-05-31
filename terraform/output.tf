output "internal_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}

output "yandex_vpc_security_group_vm_1" {
  value = yandex_vpc_security_group.gitlab_sg.id
}
