terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.49.0"
    }


  }

  #backend "azurerm" {
    #resource_group_name  = "vinod-main-rg"
    #storage_account_name = "vinodstoragetest22" # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    #container_name       = "container1"         # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    #key                  = "manual.terraform.tfstate"
  #}

}

provider "azurerm" {
  features {}
  subscription_id = "d6b5caa4-f6c2-4013-a822-74a06faa55c0"
}