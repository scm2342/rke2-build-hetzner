resource "hcloud_network" "clustername" {
  name = "clustername"
  ip_range = "10.0.0.0/8"
}

resource "hcloud_network_subnet" "clustername" {
  network_id = hcloud_network.clustername.id
  type = "cloud"
  network_zone = "eu-central"
  ip_range   = "10.0.0.0/24"
}

resource "hcloud_load_balancer" "clustername_controlplane" {
  name = "clustername_controlplane"
  load_balancer_type = "lb11"
  network_zone = "eu-central"
}

resource "hcloud_load_balancer_network" "clustername" {
  load_balancer_id = hcloud_load_balancer.clustername_controlplane.id
  network_id = hcloud_network.clustername.id
  ip = "10.0.0.2"
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
    timeout = 5
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
    timeout = 5
  }
}

resource "hcloud_load_balancer_target" "clustername_controlplane" {
  type             = "label_selector"
  load_balancer_id = hcloud_load_balancer.clustername_controlplane.id
  label_selector   = "cluster=clustername,master=true"
  use_private_ip   = true
}
