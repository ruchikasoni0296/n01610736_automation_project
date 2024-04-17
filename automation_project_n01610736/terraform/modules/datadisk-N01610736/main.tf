resource "azurerm_managed_disk" "datadisk-N01610736" {
    count                   = length(var.virtual_machine_ids)
    name                    = "${count.index}-data-disk"
    location                = var.location
    resource_group_name     = var.resource_group_name
    storage_account_type    = var.data_disk_type
    create_option           = var.data_disk_option
    disk_size_gb            = var.data_disk_size

    tags                    = local.common_tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attach" {
    count              = length(var.virtual_machine_ids)
    managed_disk_id    = element(azurerm_managed_disk.datadisk-N01610736[*].id, count.index)
    virtual_machine_id = element(var.virtual_machine_ids, count.index)
    lun                = 10
    caching            = var.data_disk_caching
    depends_on         = [ azurerm_managed_disk.datadisk-N01610736 ]
}