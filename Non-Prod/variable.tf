variable "environment" {
  type        = string
  description = "Environment name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "allowed_vm_sizes" {
  type        = list(string)
  description = "Allowed VM sizes"
}

variable "vm_size_index" {
  type        = number
  description = "Index of VM size"
}

variable "network_config" {
  type        = tuple([string, string, number])
  description = "VNet CIDR, Subnet Base, Subnet Mask"
}

variable "vm_config" {
  type = object({
    sku     = string
    version = string
  })
}

variable "is_delete" {
  type        = bool
  description = "Delete OS disk on termination"
}

variable "storage_disk" {
  type        = number
  description = "OS disk size in GB"
}

variable "resource_tags" {
  type        = map(string)
  description = "Tags for resources"
}
