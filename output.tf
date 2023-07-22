output "controller-ip" {
  value = flatten(libvirt_domain.controller[*].network_interface[0].addresses)
}

