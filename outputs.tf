
output "ip_address" {
  value = [for ip in libvirt_domain.kubernetes : {
    address = ip.network_interface.*.addresses[0].0
    }
  ]
}
