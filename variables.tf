# Set the variable value in *.tfvars file
# or using the -var="hcloud_token=..." CLI option
variable "hcloud_token" {
  sensitive = true # Requires terraform >= 0.14
}

variable "node_count" {
  description = "How many worker nodes we should do"
  type        = number
  default     = 2
}

variable "primary_internal_ip" {
  description = "Internal IP of gateway"
  type        = string
  default     = "10.0.0.2"
}
