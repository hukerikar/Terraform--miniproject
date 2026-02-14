environment = "nonprod"
location    = "west US"

allowed_vm_sizes = [
  "Standard_D2als_v6",
  "Standard_DS2_v2",
  "Standard_DS3_v2"
]

vm_size_index = 0

network_config = [
  "10.1.0.0/16",
  "10.1.2.0",
  24
]

vm_config = {
  sku     = "22_04-lts"
  version = "latest"
}

is_delete    = true
storage_disk = 32

resource_tags = {
  environment = "NONPROD"
  managed_by  = "Terraform"
  department  = "Dev"
}
