

provider "proxmox" {
  pm_api_url          = "https://10.0.40.10:8006/api2/json"
  pm_api_token_id     = var.PM_API_TOKEN_ID
  pm_api_token_secret = var.PM_API_TOKEN_SECRET
  pm_tls_insecure     = true
}
