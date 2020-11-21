output "lb_ip" {
  value = hcloud_load_balancer_network.clustername.ip
}
output "lb_id" {
  value = hcloud_load_balancer_network.clustername.id
}
output "network_id" {
  value = hcloud_network.clustername.id
}
output "lb_ipv4" {
  value = hcloud_load_balancer.clustername_controlplane.ipv4
}
output "lb_ipv6" {
  value = hcloud_load_balancer.clustername_controlplane.ipv6
}
