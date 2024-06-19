Terraform module which creates ApsaraDB for ClickHouse resources with `Clickhouse` on Alibaba Cloud.

terraform-alicloud-clickhouse
=====================================================================

[English](https://github.com/terraform-alicloud-modules/terraform-alicloud-clickhouse/blob/main/README.md) | 简体中文

本 Module 用于自动化管理云数据库ClickHouse，包括集群管理、账号管理等，包含：`Clickhouse`。

本 Module 支持创建以下资源:

* [alicloud_click_house_db_cluster](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/click_house_db_cluster)
* [alicloud_click_house_account](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/click_house_account)

## 用法

创建一个按量付费的实例：
```hcl
module "example" {
  source                  = "terraform-alicloud-modules/clickhouse/alicloud"
  #alicloud_click_house_db_cluster
  create_cluster          = true
  db_cluster_version      = "23.8"
  category                = "Basic"
  db_cluster_class        = "S8"
  db_cluster_network_type = "vpc"
  db_cluster_description  = "tf-test-clickhouse"
  db_node_group_count     = 1
  payment_type            = "PayAsYouGo"
  db_node_storage         = "500"
  storage_type            = "cloud_essd"
  vswitch_id              = "vsw-abc12345"
  #alicloud_click_house_account
  create_account          = true
  account_description     = "tf-test-clickhouse-account"
  account_name            = "testaccountname"
  account_password        = "Tf-testpwd"
  account_type            = "Normal"
}
```
创建一个包年包月的实例：
```hcl
module "example" {
  source                  = "terraform-alicloud-modules/clickhouse/alicloud"
  #alicloud_click_house_db_cluster
  create_cluster          = true
  db_cluster_version      = "23.8"
  category                = "Basic"
  db_cluster_class        = "S8"
  db_cluster_network_type = "vpc"
  db_cluster_description  = "tf-test-clickhouse"
  db_node_group_count     = 1
  payment_type            = "Subscription"
  period                  = "Month"
  used_time               = "1"
  renewal_status          = "Normal"
  db_node_storage         = "500"
  storage_type            = "cloud_essd"
  vswitch_id              = "vsw-abc12345"
  #alicloud_click_house_account
  create_account          = true
  account_description     = "tf-test-clickhouse-account"
  account_name            = "testaccountname"
  account_password        = "Tf-testpwd"
  account_type            = "Normal"
}
```

## 示例

* [Clickhouse 完整示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-clickhouse/tree/master/examples/complete)

## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file`
  中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置.

## 要求

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.134.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.134.0 |

## 提交问题

如果在使用该 Terraform Module
的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

## 作者

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## 许可

MIT Licensed. See LICENSE for full details.

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
