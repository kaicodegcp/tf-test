variable "scope" {
  description = "Name of the secret scope."
  type        = string
}

variable "principal" {
  description = "Principal to grant access to."
  type        = string
}

variable "permission" {
  description = "Permission level (READ, WRITE, MANAGE)."
  type        = string
  default     = "READ"
}
