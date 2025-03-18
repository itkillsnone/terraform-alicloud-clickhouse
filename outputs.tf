output "this_click_house_db_cluster_id" {
  value       = concat(alicloud_click_house_db_cluster.cluster[*].id, [""])[0]
  description = "The db cluster id."
}

output "this_click_house_db_cluster_status" {
  value       = concat(alicloud_click_house_db_cluster.cluster[*].status, [""])[0]
  description = "The db cluster status."
}

output "this_click_house_account_name" {
  value       = concat(alicloud_click_house_account.account[*].account_name, [""])[0]
  description = "The db account name."
}

output "this_click_house_account_type" {
  value       = concat(alicloud_click_house_account.account[*].type, [""])[0]
  description = "The db account type."
}