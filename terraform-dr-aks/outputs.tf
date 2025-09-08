output "aks_cluster_name" {
  value = module.aks.cluster_name
}
output "acr_login_server" {
  value = module.acr.login_server
}
output "storage_account_name" {
  value = module.storage.storage_account_name
}
