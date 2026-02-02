# Azure <> Terraform module
Terraform module for creation Azure <>

## Usage

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.0 |
| <a name="requirement_databricks"></a> [databricks](#requirement\_databricks) | ~>1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_databricks"></a> [databricks](#provider\_databricks) | ~>1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [databricks_credential.this](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/credential) | resource |
| [databricks_grants.credential](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/grants) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud"></a> [cloud](#input\_cloud) | Cloud (azure or aws) | `string` | n/a | yes |
| <a name="input_service_credential"></a> [service\_credential](#input\_service\_credential) | Object with service credentials configuration attributes | <pre>object({<br/>    azure_access_connector_id = optional(string, null) # Azure Databricks Access Connector Id<br/>    aws_iam_role_arn          = optional(string, null) # AWS IAM role ARN<br/>    name                      = optional(string, null) # Custom whole name of resource    <br/>    owner                     = optional(string)       # Owner of resource<br/>    force_destroy             = optional(bool, true)<br/>    comment                   = optional(string, "Managed identity credential provisioned by Terraform")<br/>    isolation_mode            = optional(string, "ISOLATION_MODE_OPEN")<br/>  })</pre> | n/a | yes |
| <a name="input_service_credential_permissions"></a> [service\_credential\_permissions](#input\_service\_credential\_permissions) | Permissions granted on service credential | <pre>set(object({<br/>    principal  = string<br/>    privileges = list(string)<br/>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_credential_name"></a> [service\_credential\_name](#output\_service\_credential\_name) | Service Credential name |
<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](./LICENSE)
