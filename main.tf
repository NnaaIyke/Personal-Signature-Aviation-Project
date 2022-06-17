#########################################################
#This are the data sources 
##############################################################

data "azurerm_subscription" "current" {
}

data "azurerm_client_config" "current" {
}

data "azurerm_policy_definition" "currents" {
  display_name = "Configure network security groups to enable traffic analytics"

}

# data "azurerm_policy_definition" "that" {
#   display_name = "Allowed locations"

# }

data "azurerm_policy_definition" "them" {
  display_name = "[Preview]: All Internet traffic should be routed via your deployed Azure Firewall"

}

data "azurerm_policy_definition" "those" {
  display_name = "Storage accounts should restrict network access using virtual network rules"
}





#######################################################
# Resources
######################################################

resource "azurerm_management_group" "this" {
  display_name = var.managementgroup

  # subscription_ids = [
  #   data.azurerm_subscription.current.subscription_id,
  # ]
}

resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.resource_group_location

}

