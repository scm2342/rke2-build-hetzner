output "ipv4s" {
  value = hcloud_server.master.*.ipv4_address
}

output "ipv6s" {
  value = hcloud_server.master.*.ipv6_address
}
