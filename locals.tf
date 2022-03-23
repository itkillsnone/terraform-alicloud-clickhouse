locals {
  # Get ID of click house resources
  this_cluster_id = var.create_cluster ? concat(alicloud_click_house_db_cluster.cluster.*.id, [""])[0] : var.db_cluster_id
}