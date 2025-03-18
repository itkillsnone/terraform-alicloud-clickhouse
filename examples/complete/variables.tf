#################
# Click House DBCluster
#################
variable "region" {
  description = "The region of DBCluster."
  default     = "cn-beijing"
  type        = string
}

variable "db_cluster_description" {
  description = "The DBCluster description."
  type        = string
  default     = "tf-test-clickhouse"
}

variable "db_cluster_access_white_list" {
  description = "(Optional) The whitelist of the clickhouse"
  type = list(object({
    db_cluster_ip_array_name = string
    security_ip_list         = string
  }))
  default = []
}

variable "allocate_public_connection" {
  description = "(Optional) Whether to enable public connection. Value options: `true`, `false`."
  type        = bool
  default     = false
}

variable "cold_storage" {
  description = "(Optional) Whether to use cold storage. Valid values: `ENABLE`, `DISABLE`, default to `DISABLE`. When it's set to `ENABLE`, cold storage will be used, and `cold_storage` cannot be set to `DISABLE` again."
  type        = string
  default     = "DISABLE"

  validation {
    condition     = contains(["DISABLE", "ENABLE"], var.cold_storage)
    error_message = "Allowed values are DISABLE or ENABLE."
  }
}

#################
# Click House Account
#################
variable "account_description" {
  description = "Account description. May contain Chinese and English characters, lowercase letters, numbers, and underscores (_), the dash (-). Cannot start with http:// and https:// at the beginning. Length is from 2 to 256 characters."
  type        = string
  default     = "tf-test-clickhouse-account"
}

variable "account_password" {
  description = "(Required) The account password: uppercase letters, lowercase letters, lowercase letters, numbers, and special characters (special character! #$%^& author (s):_+-=) in a length of 8-32 bit."
  type        = string
  default     = "Tf-testpwd"
}

variable "account_type" {
  description = "(Optional, ForceNew) The type of the database account. Valid values: Normal or Super."
  type        = string
  default     = "Normal"
}
