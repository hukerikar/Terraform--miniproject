environment = "DR"
location    = "central US"

allowed_vm_sizes = [
  "Standard_D2ls_v5",
  "Standard_D2ls_v5"
]

vm_size_index = 0

network_config = [
  "10.2.0.0/16",
  "10.2.2.0",
  24
]

vm_config = {
  sku     = "22_04-lts"
  version = "latest"
}

is_delete    = true
storage_disk = 100

resource_tags = {
  environment = "DR"
  managed_by  = "Srujan"
  department  = "disaster recovery"
}
