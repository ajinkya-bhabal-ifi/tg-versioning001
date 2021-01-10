# stage/terragrunt.hcl

#Keep your provider configuration DRY
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "azurerm" {
  features {}
}
EOF
}

#Keep your backend configuration DRY
remote_state {
  backend = "azurerm"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
	resource_group_name  = "Ajinkya-RG1"
  storage_account_name = "store9291"
  container_name       = "tfstate01"
	key = "${path_relative_to_include()}/terraform1.tfstate"
	}
}

inputs = {
  location = "Central US"
  env_name = "dev"
}
