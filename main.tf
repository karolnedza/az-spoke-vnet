### Spoke with Insane Mode Enabled + HA Enabled 
module "az-spoke-west-europe-prod" {
  source  = "./avx-azure-spoke"
  region                = "Central US"
  resource_group   = "rg-spoke-1"
  account               = "az-spoke-1"
  vnet_cidr             = "10.20.0.0/20"
  gw_name               = "az-spoke1-west-eu-prod"
  vnet_name             = "az-spoke1-west-eu-vnet-prod"
  insane_mode            = true  # default is true,
  ha_gw                  = true  # default is true, this line is not needed here and can be removed
  gw_subnet_cidr           = "10.20.0.0/26"  # must be /26 for Insane Mode
  gw_subnet_cidr_hagw      = "10.20.0.64/26" # must be /26 for Insane Mode 
  subnet_vm1          = "10.20.0.128/28"   # here VM lives
  subnet_vm2          = "10.20.0.144/28"   # here VM lives
  transit_gw           = "az-transit-hpe-tgw"
  security_domain      = "prod"
}

# ### Spoke with Insane Mode Disabled + HA Disabled  

module "az-spoke-west-europe-prod-spoke-2" {
  source  = "./avx-azure-spoke"
  region                = "West Europe"
  resource_group   = "rg-spoke-2"
  account               = "az-spoke-1"
  vnet_cidr             = "10.30.0.0/24"
  gw_name               = "az-spoke2-west-eu-prod"
  vnet_name             = "az-spoke2-west-eu-vnet-prod"
  insane_mode            = false  # default is false, this line is not needed here and can be removed
  ha_gw                  = false  # default is true,
  gw_subnet_cidr       = "10.30.0.0/28"
#  gw_subnet_cidr_hagw = "xxxx" - HA is disabled, no need for subnet_cidr_hagw
  subnet_vm1          = "10.30.0.128/28"   # here VM lives
  subnet_vm2          = "10.30.0.144/28"   # here VM lives
  transit_gw           = "az-transit-hpe-tgw"
  security_domain      = "prod"
}
