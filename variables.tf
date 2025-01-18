variable "PM_API_TOKEN_ID" {
  type        = string
  description = "Proxmox API Token ID"
}

variable "PM_API_TOKEN_SECRET" {
  type        = string
  description = "Proxmox API Token Secret"
  sensitive   = true
}
