# Projects Factory Terraform Module

Projects Factory module which manages configuration and life-cycle
of your Terraform projects.

## Permissions

### HCP Terraform Permissions

To manage resources, provide a user token from an account with
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
* Set the `TFE_TOKEN` environment variable. The provider can read the TFE\_TOKEN environment variable and the token stored there
to authenticate.

## Features

Manages configuration and life-cycle of HCP Terraform resources:

* Project
* Variable Sets
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
