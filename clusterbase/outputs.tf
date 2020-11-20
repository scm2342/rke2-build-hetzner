output "lb_ip" {
  value = hcloud_load_balancer_network.clustername.ip
}
output "network_id" {
  value = hcloud_network.clustername.id
}
