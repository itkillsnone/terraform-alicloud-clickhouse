#alicloud_ecp_instance
db_cluster_description = "tf-test-update-clickhouse"
db_cluster_access_white_list = [{
  db_cluster_ip_array_name = "test"
  security_ip_list = "127.0.0.2"
},{
  db_cluster_ip_array_name = "test2"
  security_ip_list = "127.0.0.0,127.1.1.1"
}]
#alicloud_click_house_account
account_description = "tf-test-update-clickhouse-account"
account_password    = "Tf-updatetestpwd"
account_type        = "Super"