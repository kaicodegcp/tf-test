variable "catalog_name" {
  description = "Name of the catalog to grant permissions on."
  type        = string
}

variable "grants" {
  description = "List of grants to apply."
  type = list(object({
    principal  = string
    privileges = list(string)
  }))
}
