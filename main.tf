resource "databricks_credential" "this" {
  name    = var.service_credential.name
  owner   = var.service_credential.owner
  purpose = "SERVICE"

  # Dynamic block for Azure
  dynamic "azure_managed_identity" {
    for_each = var.cloud == "azure" ? [1] : []
    content {
      access_connector_id = var.service_credential.azure_access_connector_id
    }
  }

  # Dynamic block for AWS
  dynamic "aws_iam_role" {
    for_each = var.cloud == "aws" ? [1] : []
    content {
      role_arn = var.service_credential.aws_iam_role_arn
    }
  }

  # TDOO 
  # Dynamic block for GCP
  # GCP is not yet supported
  # dynamic "databricks_gcp_service_account" {
  #  for_each = var.cloud == "gcp" ? [1] : []
  #  content {}
  #}

  force_destroy  = var.service_credential.force_destroy
  comment        = var.service_credential.comment
  isolation_mode = var.service_credential.isolation_mode
}

resource "databricks_grants" "credential" {
  count = length(var.service_credential_permissions) == 0 ? 0 : 1

  credential = databricks_credential.this.id
  dynamic "grant" {
    for_each = var.service_credential_permissions
    content {
      principal  = grant.value.principal
      privileges = grant.value.privileges
    }
  }
}
