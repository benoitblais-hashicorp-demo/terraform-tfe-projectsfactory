# The following code block is used to create and manage the project where all the workspaces related to the published modules will be stored.

resource "tfe_project" "this" {
  name         = var.project_name
  organization = var.organization
  description  = var.project_description
  tags = merge(var.project_tags, {
    managed_by_terraform = "true"
  })
}

# The following module blocks are used to create and manage the HCP Terraform teams required by the `projects factory`.

module "team_write" {
  source         = "app.terraform.io/benoitblais-hashicorp/team/tfe"
  version        = "1.0.0"
  count          = var.sso_write_team_id != null ? 1 : 0
  name           = lower(replace("${tfe_project.this.name}-write", "/\\W|_|\\s/", "-"))
  organization   = var.organization
  project_access = "write"
}

module "team_read" {
  source         = "app.terraform.io/benoitblais-hashicorp/team/tfe"
  version        = "1.0.0"
  count          = var.sso_read_team_id != null ? 1 : 0
  name           = lower(replace("${tfe_project.this.name}-read", "/\\W|_|\\s/", "-"))
  organization   = var.organization
  project_access = "read"
}

# The following code block is used to create and manage the variable set at the project level that will own the variables required by the child workspaces.

# NOTE: How can we configure the scope

resource "tfe_variable_set" "this" {
  name              = lower(replace("${tfe_project.this.name}-hcp", "/\\W|_|\\s/", "-"))
  description       = "Variable set for project \"${tfe_project.this.name}\"."
  organization      = var.organization
  parent_project_id = tfe_project.this.id
}

# The following code block is used to create and manage the variables within the variable set at the project level.

resource "tfe_variable" "this" {
  for_each        = {for variable in var.variable_set_variables : variable.key => variable}
  key             = each.value.key
  value           = each.value.value
  category        = each.value.category
  description     = lookup(each.value, "description", null)
  hcl             = lookup(each.value, "hcl", false)
  sensitive       = lookup(each.value, "sensitive", false)
  variable_set_id = tfe_variable_set.this.id
}
