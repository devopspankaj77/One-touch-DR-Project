variable "subscription_id" {}
variable "tenant_id" {}
variable "location" {
  default = "East US"
}
variable "resource_group_name" {
  default = "rg-dr-aks"
}
variable "aks_node_count" {
  default = 2
}
variable "aks_node_size" {
  default = "Standard_DS2_v2"
}
