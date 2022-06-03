# Variable for Management group #

variable "managementgroup" {
    type = string
    default = "mg-p-Connectivity-001"
  
}

variable "cust_scope" {
    default = "/subscriptions/3328bbe5-2bb4-4517-a3c0-503d05c9292e/resourceGroups/RG1/providers/Microsoft.Storage/storageAccounts/sigavi"
}

variable "cast_scope" {
    default = "/subscriptions/3328bbe5-2bb4-4517-a3c0-503d05c9292e/resourceGroups/RG1"
}

variable "parameters" {
	default = {
      "effect": {
        "type": "String",
        "metadata": {
          "displayName": "Effect",
          "description": "Enable or disable the execution of the audit policy"
        },
        "allowedValues": [
          "Audit",
          "Deny",
          "Disabled"
        ],
        Value = "Audit"
      }
    }
}


    variable "watcher" {
        default = {
      "effect": {
        "type": "String",
        "metadata": {
          "displayName": "Effect",
          "description": "Enable or disable the execution of the policy"
        },
        "allowedValues": [
          "Audit",
          "Disabled"
        ],
        Value = "Audit"
      }
    }
    }
    


variable "resource_group_location" {
 type = string 
 default = "West US"
}