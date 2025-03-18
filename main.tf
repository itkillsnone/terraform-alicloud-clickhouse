resource "alicloud_click_house_db_cluster" "cluster" {
  count              = var.create_cluster ? 1 : 0
  db_cluster_version = var.db_cluster_version
  category           = var.category
  db_cluster_class   = var.db_cluster_class
  dynamic "db_cluster_access_white_list" {
    for_each = var.db_cluster_access_white_list
    content {
      db_cluster_ip_array_name = db_cluster_access_white_list.value.db_cluster_ip_array_name
      security_ip_list         = db_cluster_access_white_list.value.security_ip_list
    }
  }

  dynamic "multi_zone_vswitch_list" {
    for_each = var.multi_zone_vswitch_list
    content {
      zone_id    = multi_zone_vswitch_list.value.zone_id
      vswitch_id = multi_zone_vswitch_list.value.vswitch_id
    }
  }

  db_cluster_network_type    = "vpc"
  db_cluster_description     = var.db_cluster_description
  db_node_group_count        = var.db_node_group_count
  payment_type               = var.payment_type
  renewal_status             = local.this_cluster_renewal_status
  period                     = local.this_cluster_period
  used_time                  = local.this_cluster_used_time
  db_node_storage            = var.db_node_storage
  storage_type               = var.storage_type
  vswitch_id                 = var.vswitch_id
  resource_group_id          = var.resource_group_id
  allocate_public_connection = var.allocate_public_connection
  cold_storage               = var.cold_storage
}

resource "alicloud_click_house_account" "account" {
  count               = var.create_account ? 1 : 0
  db_cluster_id       = local.this_cluster_id
  account_description = var.account_description
  account_name        = var.account_name
  account_password    = var.account_password
  type                = var.account_type
}

