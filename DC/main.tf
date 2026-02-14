resource "azurerm_resource_group" "example" {
  name     = "${var.environment}-resources"
  location = var.location
}

resource "azurerm_virtual_network" "main" {
  
  name                = "${var.environment}-network"
  address_space       = [var.network_config[0]]
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes = ["${var.network_config[1]}/${var.network_config[2]}"]

}
resource "azurerm_public_ip" "main" {
  name                = "${var.environment}-pip"
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_interface" "main" {
  name                = "${var.environment}-nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.main.id


    
  }
}

resource "azurerm_linux_virtual_machine" "main" {

  name                = "${var.environment}-vm"
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.main.id]
  size                =  var.allowed_vm_sizes[var.vm_size_index]

  # Spot VM (Cheap)
  priority        = "Spot"
  eviction_policy = "Deallocate"
  max_bid_price   = -1

  admin_username = "testadmin"
  admin_password = "Password1234!"
  disable_password_authentication = false

  os_disk {
    name                 = "${var.environment}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = var.storage_disk
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = var.vm_config.sku
    version   = var.vm_config.version
  }

  tags = var.resource_tags
}

resource "azurerm_network_security_group" "prod" {
  
  name                = "${var.environment}-nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name
  
  dynamic "security_rule" {
    for_each = local.inbound_rules

    content {
      name                       = "Allow-${security_rule.key}"
      priority                   = security_rule.value.priority
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = security_rule.value.port
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
    
}


