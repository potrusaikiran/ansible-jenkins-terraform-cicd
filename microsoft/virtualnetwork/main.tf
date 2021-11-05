resource "azurerm_virtual_network" "vnet" {
  for_each            = local.vnets
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
  dns_servers         = each.value.dns_servers != [] ? each.value.dns_servers : []
  tags                = each.value.tags
}

resource "azurerm_subnet" "subnets" {
  for_each             = local.subnets
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
  depends_on = [
    azurerm_virtual_network.vnet
  ]
}