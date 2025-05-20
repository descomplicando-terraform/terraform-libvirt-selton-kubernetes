variable "source" {
  type        = string
  default     = "git@github.com:descomplicando-terraform/terraform-libvirt-selton-groundwork.git?ref=0.0.2"
  description = "Release for terraform groundwork"
}

variable "pool" {
  type        = string
  default     = "kubernetes"
  description = "Name of the pool that will be created"
}

variable "libvirt_disk_path" {
  type        = string
  default     = "var/lib/libvirt/pool/kubernetes"
  description = "Path to libvirt the pool"
}

variable "nodes" {
  type        = list(any)
  default     = ["edge01", "edge02"]
  description = "List with the names of each node that will be created"
}

variable "img" {
  type        = string
  default     = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
  description = "Path to the image that will be used"
}

variable "memory" {
  type        = number
  default     = 4096
  description = "ram"
}

variable "vcpus" {
  type        = number
  default     = 2
  description = "vcpu"
}
