
output "domain" {
  value = [for domain in libvirt_domain.kubernetes : {
    address = domain.network_interface.0.addresses[0]
    }
  ]
}
