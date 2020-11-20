variable "agent_count" {
  default     = 3
  description = "Count of rke2 agent servers"
}
variable "agent_type" {
  type        = string
  default     = "cx21"
  description = "machine type to use for the agents"
}
variable "rke2_cluster_secret" {
  type        = string
  description = "Cluster secret for rke2 cluster registration"
}
variable "clustername" {
  type        = string
  description = "name of the cluster"
}
