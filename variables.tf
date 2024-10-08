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
