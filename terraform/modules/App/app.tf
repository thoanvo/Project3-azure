resource "azurerm_app_service_plan" "app" {
  name  = "${var.name_app}"
  location = var.location
  resource_group_name = var.resource_group_name

  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "app" {
  name = var.name_app
  location  = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.app.id

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = 0
  }
}