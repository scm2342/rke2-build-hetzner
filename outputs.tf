output "ipv4" {
  value = module.clusterbase.lb_ipv4
}
output "ipv6" {
  value = module.clusterbase.lb_ipv6
}

output "agent_ipv4" {
  value = module.agentpool.ipv4s
}
output "agent_ipv6" {
  value = module.agentpool.ipv6s
}

output "master_ipv4" {
  value = module.masterpool.ipv4s
}
output "master_ipv6" {
  value = module.masterpool.ipv6s
}
