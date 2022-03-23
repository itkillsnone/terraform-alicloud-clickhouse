output "this_click_house_db_cluster_id" {
  value = concat(alicloud_click_house_db_cluster.cluster.*.id, [""])[0]
}

output "this_click_house_db_cluster_status" {
  value = concat(alicloud_click_house_db_cluster.cluster.*.status, [""])[0]
}

output "this_click_house_account_name" {
  value = concat(alicloud_click_house_account.account.*.account_name, [""])[0]
}
