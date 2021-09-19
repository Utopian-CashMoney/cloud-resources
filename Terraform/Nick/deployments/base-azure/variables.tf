
variable "location" {
  description = "Location of main resource group"
  type        = string
  default     = "East US"
}

variable "kubernetes_version" {
  description = "Version of Kubernetes running on AKS"
  type        = string
  default     = "1.21.2"
}

variable "windows_profile_admin_username" {
  description = "Windows profile username for AKS"
  type        = string
  default     = "azureuser"
}

variable "windows_profile_admin_password" {
  description = "Windows profile password for AKS"
  type        = string
  sensitive   = true
}
