output "service_credential_name" {
  value       = try(databricks_credential.this.name, null)
  description = "Service Credential name"
}
