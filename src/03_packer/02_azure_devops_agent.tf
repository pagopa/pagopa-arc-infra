resource "azurerm_resource_group" "azdo_rg" {
  name     = "${local.project}-azdoa-rg"
  location = var.location

  tags = var.tags
}

module "azdoa_custom_image" {
  source = "./.terraform/modules/__v3__/azure_devops_agent_custom_image"

  prefix              = var.prefix
  resource_group_name = azurerm_resource_group.azdo_rg.name
  location            = var.location
  image_name          = "${local.project}-azdo-agent-ubuntu2204-image"
  image_version       = "v1"
  subscription_id     = data.azurerm_subscription.current.subscription_id
}
