variable "ssh_keys" {
  type        = list
  description = "ssh key names"
}
variable "clustername" {
  type        = string
  description = "name of the cluster"
}
variable "agent_count" {
  default     = 3
  description = "Count of rke2 agent servers"
}
variable "agent_type" {
  type        = string
  default     = "cx21"
  description = "machine type to use for the agents"
}
variable "extra_ssh_keys" {
  type        = list
  default     = []
  description = "Extra ssh keys to inject into Rancher instances"
}
variable "rke2_cluster_secret" {
  type        = string
  description = "Cluster secret for rke2 cluster registration"
}
variable "rke2_version" {
  type        = string
  default     = ""
  description = "Version of rke2 to install"
}
variable "location" {
  type        = string
  default     = "nbg1"
  description = "hetzner location"
}
variable "lb_ip" {
  type        = string
  description = "ip of the lb to use to connect agents"
}
variable "lb_id" {
  type        = string
  description = "id of the load balancer to connect masters"
}
variable "network_id" {
  type        = string
  description = "network id to put servers into"
}
variable "api_token" {
  type        = string
  description = "hetzner api token with read permission to read lb state"
}
