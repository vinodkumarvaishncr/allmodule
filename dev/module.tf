
module "rg" {
  source = "../custom/azurerm_rg"
  rg_list = var.rg_list
}
/*
module "storageacc" {
  depends_on  = [module.rg]
  source = "../custom/azurerm_storage_account"
  storage_account_list =var.storage_account_list
}
*/
module "pip" {
  depends_on = [module.rg]
  source = "../custom/azurerm_publicip"
  pip_info = var.pip_info

   
}

module "vnet" {
  depends_on = [module.rg]
  source = "../custom/azurerm_vnet"
  vnet_list = var.vnet_list
}

module "subnet" {
  depends_on = [module.rg,module.vnet]
  source = "../custom/azurerm_subnet"
  subnet_list = var.subnet_list
}


module "nic" {
  depends_on = [module.rg,module.vnet,module.subnet,module.pip]
  source = "../custom/azurerm_nic"
  nic_config = var.nic_config
  public_ip_ids  = module.pip.public_ip_ids   # ✅ Correct place
}

module "vm" {
  depends_on = [module.rg,module.vnet,module.subnet,module.nic]
  source = "../custom/azurerm_vm"
  vms = var.vms
}

