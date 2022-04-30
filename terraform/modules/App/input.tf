# Resource Group
variable "location" {
    type = string
    description = "name of location azure"
}
variable "resource_group_name" {
    type = string
    description = "name of resource group main"
}
#APP
variable "name_app" {
  type = string
  description = "Name of app"
}