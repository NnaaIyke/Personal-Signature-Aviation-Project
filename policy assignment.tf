

# Start for policy creation #

resource "azurerm_resource_policy_assignment" "this" {
  name                 = "audit-vm-manageddisks"
  resource_id          = var.cust_scope
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/06a78e20-9358-41c9-923c-fb736d382a4d"
  description          = "Shows all virtual machines not using managed disks"
  display_name         = "Audit VMs without managed disks assignment"
}

# policy for storage #

resource "azurerm_management_group_policy_assignment" "that" {
  name                 = "Storage Accounts"
  management_group_id  = azurerm_management_group.parent.id
  policy_definition_id = data.azurerm_policy_definition.that.id
  parameters           = var.parameters != null ? jsonencode(var.parameters) : null
  location             = var.resource_group_location
}

# Network Watcher flow logs should have traffic analytics enabled #

resource "azurerm_management_group_policy_assignment" "those" {
  name                 = "Network Watcher"
  management_group_id  = azurerm_management_group.parent.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/2f080164-9f4d-497e-9db6-416dc9f7b48a"
  parameters           = var.watcher != null ? jsonencode(var.watcher) : null
  location             = var.resource_group_location
}



# Deploy network watcher when virtual networks are created #

resource "azurerm_management_group_policy_assignment" "them" {
  name                 = "Deploy Netwrk Watcer"
  management_group_id  = azurerm_management_group.parent.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/a9b99dd8-06c5-4317-8629-9d86a3c6e7d9"
  location             = var.resource_group_location

  identity {
    type = "SystemAssigned"
  }

}


# Add a tag to a resource #

resource "azurerm_management_group_policy_assignment" "there" {
  name                 = "Add a tag to Resource"
  management_group_id  = azurerm_management_group.parent.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/4f9dc7db-30c1-420c-b61a-e1d640128d26"
  location             = var.resource_group_location

}

#identity {
#type = "SystemAssigned"
#}

#}
