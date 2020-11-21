variable "domain" {
  type        = string
  description = "domain of the cluster"
}
variable "rke2_cluster_secret" {
  type        = string
  description = "Cluster secret for rke2 cluster registration"
}
variable "clustername" {
  type        = string
  description = "name of the cluster"
}
variable "api_token" {
  type        = string
  description = "hetzner api token with read permission to read lb state"
}
