locals {
  inbound_rules = {
    http = {
      port     = 80
      priority = 100
    }
    https = {
      port     = 443
      priority = 110
    }
    ssh = {
      port     = 22
      priority = 120
    }
  }
}
