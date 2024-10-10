module "groundwork" {
  source = "https://github.com/descomplicando-terraform/terraform-libvirt-selton-groundwork.git"

  nodes = var.nodes
}
resource "libvirt_volume" "ubuntu-kubernetes" {
  count  = length(groundwork_libvirt.var.nodes)
  name   = "ubuntuqcow-${var.nodes[count.index]}"
  pool   = module.groundwork.libvirt_pool.kubernetes.name
  source = var.img
  format = "qcow2"
}

data "template_file" "user_data" {
  count    = length(var.nodes)
  template = <<EOF
#cloud-config
ssh_pwauth: True
users:
  - name: ${nodes[count.index]}
    lock_passwd: false
    plain_text_passwd: ${var.nodes[count.index]} 
    sudo: ALL=(ALL) NOPASSWD:ALL
EOF

  vars = {
    hostname = var.nodes[count.index]
  }
}

resource "libvirt_cloudinit_disk" "commoninit" {
  count = length(var.nodes)
  name  = "${var.nodes[count.index]}-commoninit.iso"
  pool  = module.groundwork.libvirt_pool.kubernetes[count.index].name
  user_data = template_file.user_data[count.index].rendered
}

resource "libvirt_domain" "kubernetes" {
  count  = length(var.nodes)
  name   = var.nodes[count.index]
  memory = var.memory
  vcpu   = var.vcpus

  cloudinit = libvirt_cloudinit_disk.commoninit[count.index].id

  network_interface {
    network_name   = module.groundwork.libvirt_network.kubernetes-network[count.index].name
    wait_for_lease = true
    hostname       = var.nodes[count.index]
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_port = "1"
    target_type = "virtio"
  }

  disk {
    volume_id = libvirt_volume.ubuntu-kubernetes[count.index].id
  }

  qemu_agent = true

}