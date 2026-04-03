variable "engine_name" {
  description = "Enter the DB engine"
  type        = string
  default     = "mysql"
}

variable "db_name" {
  description = "Enter the database name"
  type        = string
  default     = "tcw"
}

variable "user_name" {
  description = "Enter DB username"
  type        = string
  default     = "tcw"
}

variable "pass" {
  description = "Enter DB password"
  type        = string
  default     = "TheCloudWorld.2019"
  sensitive   = true
}

variable "multi_az_deployment" {
  description = "Enable or disable multi AZ"
  type        = bool
  default     = false
}

variable "public_access" {
  description = "Public access required or not"
  type        = bool
  default     = false
}

variable "skip_finalSnapshot" {
  type    = bool
  default = true
}

variable "delete_automated_backup" {
  type    = bool
  default = true
}

variable "instance_class" {
  type    = string
  default = "db.t3.small"
}
