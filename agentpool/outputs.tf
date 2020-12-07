output "ipv4s" {
  value = hcloud_server.agent.*.ipv4_address
}

output "ipv6s" {
  value = hcloud_server.agent.*.ipv6_address
}
