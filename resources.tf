

resource "azurerm_virtual_network" "this" {
  name                = "VN-Connectivity-dev001"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
}

#Azure Firewall Subnet#
resource "azurerm_subnet" "this" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.0.1.0/24"]
}

#This the first Subnet, its network security group and its netwrok security group assignment#
resource "azurerm_subnet" "these" {
  name                 = "Subnet001"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.0.3.0/24"]
}

resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = azurerm_subnet.these.id
  network_security_group_id = azurerm_network_security_group.them.id
}

resource "azurerm_network_security_group" "them" {
  name                = "nsg-sigvnet-dev-002"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  security_rule {
    name                       = "nsgsr-sigvnettcp-dev-002"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}


#This is the second Subnet, its network Security Group and its assignment#
resource "azurerm_subnet" "then" {
  name                 = "Subnet-002"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet_network_security_group_association" "examples" {
  subnet_id                 = azurerm_subnet.then.id
  network_security_group_id = azurerm_network_security_group.this.id
}

resource "azurerm_network_security_group" "this" {
  name                = "nsg-sigvnet-dev-001"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  security_rule {
    name                       = "nsgsr-sigvnettcp-dev-001"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}


#this is the third subnet, its network security group and its assignment#
resource "azurerm_subnet" "that" {
  name                 = "Subnet003"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.0.4.0/24"]
}

resource "azurerm_subnet_network_security_group_association" "examp" {
  subnet_id                 = azurerm_subnet.that.id
  network_security_group_id = azurerm_network_security_group.then.id
}

resource "azurerm_network_security_group" "then" {
  name                = "nsg-sigvnet-dev-003"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  security_rule {
    name                       = "nsgsr-sigvnettcp-dev-003"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}



resource "azurerm_public_ip" "this" {
  name                = "test-p-ip"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "this" {
  name                = "afw-connectivity-001"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.this.id
    public_ip_address_id = azurerm_public_ip.this.id
  }
}
