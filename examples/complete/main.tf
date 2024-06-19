variable "region" {
  default = "cn-beijing"
}

provider "alicloud" {
  region = var.region
}

data "alicloud_click_house_regions" "default" {
  region_id = var.region
}

module "vpc" {
  source             = "alibaba/vpc/alicloud"
  create             = true
  vpc_name           = "tf-test-clickhouse"
  vpc_cidr           = "172.16.0.0/16"
  vswitch_name       = "tf-test-clickhouse"
  vswitch_cidrs      = ["172.16.0.0/21"]
  availability_zones = [data.alicloud_click_house_regions.default.regions.0.zone_ids.0.zone_id]
}


module "example_pay_as_you_go" {
  source = "../.."

  #alicloud_click_house_db_cluster
  create_cluster               = true
  db_cluster_version           = "22.8.5.29"
  category                     = "Basic"
  db_cluster_class             = "S8"
  db_cluster_description       = var.db_cluster_description
  db_node_group_count          = 1
  payment_type                 = "PayAsYouGo"
  db_node_storage              = "500"
  storage_type                 = "cloud_essd"
  vswitch_id                   = module.vpc.this_vswitch_ids[0]
  db_cluster_access_white_list = var.db_cluster_access_white_list
  #alicloud_click_house_account
  create_account      = true
  account_description = var.account_description
  account_name        = "testaccountname"
  account_password    = var.account_password
  account_type        = var.account_type

}


data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}
data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_click_house_regions.default.regions.0.zone_ids.0.zone_id
}

module "example_subscription" {
  source = "../.."

  #alicloud_click_house_db_cluster
  create_cluster               = true
  db_cluster_version           = "22.8.5.29"
  category                     = "Basic"
  db_cluster_class             = "S8"
  db_cluster_description       = var.db_cluster_description
  db_node_group_count          = 1
  payment_type                 = "Subscription"
  renewal_status               = "AutoRenewal"
  period                       = "Month"
  used_time                    = "2"
  db_node_storage              = "100"
  storage_type                 = "cloud_essd"
  vswitch_id                   = data.alicloud_vswitches.default.ids.0
  db_cluster_access_white_list = var.db_cluster_access_white_list
  #alicloud_click_house_account
  create_account      = true
  account_description = var.account_description
  account_name        = "testaccountname"
  account_password    = var.account_password
  account_type        = var.account_type

}
