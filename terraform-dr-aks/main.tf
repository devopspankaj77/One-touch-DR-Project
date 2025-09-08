module "network" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "acr" {
  source              = "./modules/acr"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "aks" {
  source              = "./modules/aks"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = module.network.subnet_id
  acr_id              = module.acr.acr_id
}

module "storage" {
  source              = "./modules/storage"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "argocd" {
  source = "./modules/argocd"
}

module "velero" {
  source          = "./modules/velero"
  storage_account = module.storage.storage_account_name
  resource_group  = var.resource_group_name
  location        = var.location
}

module "app" {
  source = "./modules/app"
}


module "monitoring" {
  source              = "./modules/monitoring"
  monitoring_namespace = "monitoring"
  slack_webhook_url    = "https://hooks.slack.com/services/T000/B000/XXXX"
}
