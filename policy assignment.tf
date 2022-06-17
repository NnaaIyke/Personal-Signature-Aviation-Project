#Resources to create Policies attached to either a Management Group, ResourceGroup or a Resources Itself#

#Policy 1
#resource "azurerm_management_group_policy_assignment" "this" {
#name                 = "Network Security Groups"
#management_group_id  = azurerm_management_group.this.id
#policy_definition_id = data.azurerm_policy_definition.this.id
#parameters           = var.parameters != null ? jsonencode(var.parameters) : null
#location             = var.resource_group_location

#identity {
#type = "SystemAssigned"
#}

#}

#Policy 2
#resource "azurerm_management_group_policy_assignment" "this" {
#name                 = "Allowed locations"
#management_group_id  = azurerm_management_group.this.id
#policy_definition_id = data.azurerm_policy_definition.that.id
#parameters           = var.parameter != null ? jsonencode(var.parameter) : null
#location             = var.resource_group_location

#}

#Policy 3
resource "azurerm_management_group_policy_assignment" "those" {
  name                 = "Internet traffic"
  management_group_id  = azurerm_management_group.this.id
  policy_definition_id = data.azurerm_policy_definition.them.id
  parameters           = var.parametere != null ? jsonencode(var.parametere) : null
  location             = var.resource_group_location

  identity {
    type = "SystemAssigned"
  }

}

#Policy 4
resource "azurerm_management_group_policy_assignment" "them" {
  name                 = "Gateway Subnets"
  management_group_id  = azurerm_management_group.this.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/35f9c03a-cc27-418e-9c0c-539ff999d010"

}

#Policy 5
resource "azurerm_management_group_policy_assignment" "this" {
  name                 = "Storage account"
  management_group_id  = azurerm_management_group.this.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/4fa4b6c0-31ca-4c0d-b10d-24b96f62a751"
  parameters           = var.parameteres != null ? jsonencode(var.parameteres) : null
  location             = var.resource_group_location

}

#Policy 6
# resource "azurerm_management_group_policy_assignment" "that" {
#   name                 = "Storage Accounts"
#   management_group_id  = azurerm_management_group.thin.id
#   policy_definition_id = data.azurerm_policy_definition.that.id
#   parameters           = var.parameters != null ? jsonencode(var.parameters) : null
#   location             = var.resource_group_location
# }

#Policy 7
resource "azurerm_management_group_policy_assignment" "then" {
  name                 = "Network Watcher"
  management_group_id  = azurerm_management_group.this.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/2f080164-9f4d-497e-9db6-416dc9f7b48a"
  parameters           = var.watcher != null ? jsonencode(var.watcher) : null
  location             = var.resource_group_location
}



#Policy 8
resource "azurerm_management_group_policy_assignment" "thats" {
  name                 = "Deploy Network Watcher"
  management_group_id  = azurerm_management_group.this.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/a9b99dd8-06c5-4317-8629-9d86a3c6e7d9"
  location             = var.resource_group_location

  identity {
    type = "SystemAssigned"
  }

}


#Policy 9
#resource "azurerm_management_group_policy_assignment" "this" {
# name                 = "Add a tag to Resource"
# management_group_id  = azurerm_management_group.parent.id
# policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/4f9dc7db-30c1-420c-b61a-e1d640128d26"
# location             = var.resource_group_location

#}

