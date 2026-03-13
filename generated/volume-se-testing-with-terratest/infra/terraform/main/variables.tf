variable "volume_name" {
  description = "Name of the volume."
  type        = string
}

variable "catalog_name" {
  description = "Name of the catalog."
  type        = string
}

variable "schema_name" {
  description = "Name of the schema."
  type        = string
}

variable "volume_type" {
  description = "Type of the volume (MANAGED or EXTERNAL)."
  type        = string
  default     = "MANAGED"
}

variable "storage_location" {
  description = "Storage location for EXTERNAL volumes."
  type        = string
  default     = null
}
