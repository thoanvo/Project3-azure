### Network interface
resource "azurerm_network_interface" "ni" {
  name = "VM-network"
  location = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name = "VM"
    subnet_id = var.address_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = var.ip_public
  }
}

### VM availability set
resource "azurerm_availability_set" "vm_avs" {
  name = "VM-availability_set"
  location = var.location
  resource_group_name = var.resource_group_name
  platform_fault_domain_count = 2
  
}

### data image
data "azurerm_image" "image" {
  name = var.name_image
  resource_group_name = var.resource_group_name
}
  output "image_id" {
  value = data.azurerm_image.image.id
}

### VM
resource "azurerm_linux_virtual_machine" "vm" {
  name = var.name_vm
  location = var.location
  resource_group_name = var.resource_group_name
  size = var.name_size
  network_interface_ids = [azurerm_network_interface.ni.id]
  availability_set_id = azurerm_availability_set.vm_avs.id
  admin_username = var.admin_username
  source_image_id = "${data.azurerm_image.image.id}"
  os_disk {
    name = "disk-${var.name_vm}"
    caching = "ReadWrite"
    storage_account_type = var.type_storage
  }
  admin_ssh_key {
     username   = var.admin_username
     public_key = file(var.public_key_path)
    
    }
    depends_on = [
      azurerm_network_interface.ni
    ]
}

data "azurerm_managed_disk" "disk" {
  name  = "disk-${var.name_vm}"
  resource_group_name = var.resource_group_name
  depends_on = [azurerm_linux_virtual_machine.vm]
}

