# The setup for management group creation in Azure #
data "azurerm_subscription" "current" {
}

data "azurerm_policy_definition" "that" {
  display_name = "Storage accounts should restrict network access using virtual network rules"
}

resource "azurerm_management_group" "parent" {
  display_name = var.managementgroup

  subscription_ids = [
    data.azurerm_subscription.current.subscription_id,
  ]
}
