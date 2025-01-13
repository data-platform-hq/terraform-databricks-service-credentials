variable "service_credential" {
  type = object({
    azure_access_connector_id = optional(string, null) # Azure Databricks Access Connector Id
    aws_iam_role_arn          = optional(string, null) # AWS IAM role ARN
    name                      = optional(string, null) # Custom whole name of resource    
    owner                     = optional(string)       # Owner of resource
    force_destroy             = optional(bool, true)
    comment                   = optional(string, "Managed identity credential provisioned by Terraform")
    isolation_mode            = optional(string, "ISOLATION_MODE_OPEN")
  })
  description = "Object with service credentials configuration attributes"
}

variable "cloud" {
  type        = string
  description = "Cloud (azure or aws)"
}

variable "service_credential_permissions" {
  type = set(object({
    principal  = string
    privileges = list(string)
  }))
  default     = []
  description = "Permissions granted on service credential"
}