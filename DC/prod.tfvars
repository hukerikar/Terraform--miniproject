environment = "prod"
location    = "centralindia"

allowed_vm_sizes = [
  "Standard_D2ls_v5",
  "Standard_D2ls_v5"
]

vm_size_index = 0

network_config = [
  "10.0.0.0/16",
  "10.0.2.0",
  24
]

vm_config = {
  sku     = "22_04-lts"
  version = "latest"
}

is_delete    = true
storage_disk = 100

resource_tags = {
  environment = "PROD"
  managed_by  = "srujan"
  department  = "IT"
}
