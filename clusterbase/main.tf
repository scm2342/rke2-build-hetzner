resource "hcloud_network" "clustername" {
  name = var.clustername
  ip_range = var.network
}

resource "hcloud_network_subnet" "clustername" {
  network_id = hcloud_network.clustername.id
  type = "cloud"
  network_zone = var.networkzone
  ip_range   = var.subnetwork
}

resource "hcloud_load_balancer" "clustername_controlplane" {
  name = "clustername_controlplane"
  load_balancer_type = var.lb_type
  network_zone = var.networkzone
}

resource "hcloud_load_balancer_network" "clustername" {
  load_balancer_id = hcloud_load_balancer.clustername_controlplane.id
  network_id = hcloud_network.clustername.id
  ip = var.internalbalancerip
}

resource "hcloud_load_balancer_service" "clustername_joiner" {
  load_balancer_id = hcloud_load_balancer.clustername_controlplane.id
  protocol = "tcp"
  listen_port = 9345
  destination_port = 9345
  health_check {
    protocol = "tcp"
    port = 9345
    interval = 5
    timeout = 2
    retries = 5
  }
}

resource "hcloud_load_balancer_service" "clustername_kublet" {
  load_balancer_id = hcloud_load_balancer.clustername_controlplane.id
  protocol = "tcp"
  listen_port = 6443
  destination_port = 6443
  health_check {
    protocol = "tcp"
    port = 6443
    interval = 5
    timeout = 2
    retries = 2
  }
}

resource "hcloud_load_balancer_target" "clustername_controlplane" {
  type             = "label_selector"
  load_balancer_id = hcloud_load_balancer.clustername_controlplane.id
  label_selector   = "cluster=${var.clustername},master=true"
  use_private_ip   = true
  depends_on = [hcloud_load_balancer_network.clustername]
}
