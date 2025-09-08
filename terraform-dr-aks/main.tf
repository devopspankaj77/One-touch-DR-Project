module "network" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "acr" {
  source              = "./modules/acr"
  resource_group_name = var.resource_group_name
  location            = var.location
  acr_name            = var.acr_name
}

module "aks" {
  source              = "./modules/aks"
  resource_group_name = var.resource_group_name
  location            = var.location
  aks_name            = var.aks_name
  node_count          = var.node_count
  node_size           = var.node_size
  vnet_subnet_id      = module.network.subnet_id
  acr_id              = module.acr.acr_id
}

module "storage" {
  source              = "./modules/storage"
  resource_group_name = var.resource_group_name
  location            = var.location
  storage_account_name = var.storage_account_name
}

module "argocd" {
  source = "./modules/argocd"
}

module "velero" {
  source = "./modules/velero"
  storage_account_name = var.storage_account_name
  resource_group_name  = var.resource_group_name
}

module "app" {
  source = "./modules/app"
}
