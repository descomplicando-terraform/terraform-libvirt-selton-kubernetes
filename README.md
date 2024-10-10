# terraform-libvirt-selton-module
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_libvirt"></a> [libvirt](#requirement\_libvirt) | 0.7.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_libvirt"></a> [libvirt](#provider\_libvirt) | 0.7.6 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_groundwork"></a> [groundwork](#module\_groundwork) | git@github.com:descomplicando-terraform/terraform-libvirt-selton-groundwork.git | main |

## Resources

| Name | Type |
|------|------|
| [libvirt_cloudinit_disk.commoninit](https://registry.terraform.io/providers/dmacvicar/libvirt/0.7.6/docs/resources/cloudinit_disk) | resource |
| [libvirt_domain.kubernetes](https://registry.terraform.io/providers/dmacvicar/libvirt/0.7.6/docs/resources/domain) | resource |
| [libvirt_volume.ubuntu-kubernetes](https://registry.terraform.io/providers/dmacvicar/libvirt/0.7.6/docs/resources/volume) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_img"></a> [img](#input\_img) | Path to the image that will be used | `string` | `"https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | ram | `number` | `4096` | no |
| <a name="input_nodes"></a> [nodes](#input\_nodes) | List with the names of each node that will be created | `list(any)` | <pre>[<br/>  "edge01",<br/>  "edge02"<br/>]</pre> | no |
| <a name="input_pool"></a> [pool](#input\_pool) | Name of the pool that will be created | `string` | `"kubernetes"` | no |
| <a name="input_vcpus"></a> [vcpus](#input\_vcpus) | vcpu | `number` | `2` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->