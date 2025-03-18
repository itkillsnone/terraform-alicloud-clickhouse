locals {
  # Get ID of click house resources
  this_cluster_id             = var.create_cluster ? concat(alicloud_click_house_db_cluster.cluster[*].id, [""])[0] : var.db_cluster_id
  this_cluster_renewal_status = var.payment_type == "Subscription" ? var.renewal_status : null
  this_cluster_period         = var.payment_type == "Subscription" ? var.period : null
  this_cluster_used_time      = var.payment_type == "Subscription" ? var.used_time : null
}
