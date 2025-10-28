<!-- BEGIN_TF_DOCS -->
# Projects Factory Terraform Module

Project Factory module which manages configuration and life-cycle
of your Terraform projects.

## Permissions

### HCP Terraform Permissions

To manage the agent pool resources, provide a user token from an account with
appropriate permissions. This user should have the `Manage Projects`, `Manage Workspaces`,
`Manage Teams`, `Manage Membership`, and `Manage Organization Access` permission.
Alternatively, you can use a token from a team instead of a user token.

## Authentication

### HCP Terraform Authentication

The HCP Terraform provider requires a HCP Terraform/Terraform Enterprise API token in
order to manage resources.

There are several ways to provide the required token:

* Set the `token` argument in the provider configuration. You can set the token argument in the provider configuration. Use an
input variable for the token.
* Set the `TFE_TOKEN` environment variable. The provider can read the TFE\\_TOKEN environment variable and the token stored there
to authenticate.

## Features

Manages configuration and life-cycle of HCP Terraform resources:
* Project
* Variable Set
* Variables
* Teams

## Usage example

```hcl
module "project" {
  source  = "app.terraform.io/benoitblais-hashicorp/projectsfactory/tfe"
  version = "0.0.0"
  organization_name = "organization_name"
  project_name      = "project_name"
}
```

## Documentation

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.13.0)

## Modules

The following Modules are called:

### <a name="module_team_read"></a> [team\_read](#module\_team\_read)

Source: app.terraform.io/benoitblais-hashicorp/team/tfe

Version: 1.0.0

### <a name="module_team_write"></a> [team\_write](#module\_team\_write)

Source: app.terraform.io/benoitblais-hashicorp/team/tfe

Version: 1.0.0

## Required Inputs

The following input variables are required:

### <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name)

Description: (Required) Name of the organization.

Type: `string`

### <a name="input_project_name"></a> [project\_name](#input\_project\_name)

Description: (Required) Name of the project.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_project_description"></a> [project\_description](#input\_project\_description)

Description: (Optional) A description for the project.

Type: `string`

Default: `null`

### <a name="input_project_tags"></a> [project\_tags](#input\_project\_tags)

Description: (Optional) A map of key-value tags to add to the project.

Type: `map(string)`

Default: `null`

### <a name="input_sso_read_team_id"></a> [sso\_read\_team\_id](#input\_sso\_read\_team\_id)

Description: (Optional) The SSO team ID to associate with the read access team.

Type: `string`

Default: `null`

### <a name="input_sso_write_team_id"></a> [sso\_write\_team\_id](#input\_sso\_write\_team\_id)

Description: (Optional) The SSO team ID to associate with the write access team.

Type: `string`

Default: `null`

### <a name="input_variable_set_variables"></a> [variable\_set\_variables](#input\_variable\_set\_variables)

Description:   (Optional) The variable\_set\_variables is a list of object supporting the following attributes:  
    key         : (Required) Name of the variable.  
    value       : (Required) Value of the variable.  
    category    : (Required) Whether this is a Terraform or environment variable. Valid values are `terraform` or `env`.  
    description : (Optional) Description of the variable.  
    hcl         : (Optional) Whether to evaluate the value of the variable as a string of HCL code. Has no effect for environment variables. Defaults to `false`.  
    sensitive   : (Optional) Whether the value is sensitive. If true then the variable is written once and not visible thereafter. Defaults to `false`.

Type:

```hcl
list(object({
    key         = string
    value       = string
    category    = string
    description = optional(string)
    hcl         = optional(bool, false)
    sensitive   = optional(bool, false)
  }))
```

Default: `[]`

## Resources

The following resources are used by this module:

- [tfe_project.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/project) (resource)
- [tfe_variable.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) (resource)
- [tfe_variable_set.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable_set) (resource)

## Outputs

No outputs.

<!-- markdownlint-enable -->
<!-- END_TF_DOCS -->