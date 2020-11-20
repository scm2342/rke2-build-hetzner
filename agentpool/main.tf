resource "hcloud_server" "agent" {
  count = var.agent_count
  name = "${var.clustername}-agent-${count.index}"
  location = var.location
  image = "ubuntu-20.04"
  server_type = var.agent_type
  labels = {
    cluster: var.clustername,
    agent: "true"
  }
  backups = true
  ssh_keys = var.ssh_keys
  user_data = templatefile("${path.module}/agent_userdata.tmpl", {
    extra_ssh_keys = var.extra_ssh_keys,
    rke2_cluster_secret = var.rke2_cluster_secret,
    lb_address = var.lb_ip
    agent_index = count.index,
    rke2_version = var.rke2_version
  })
}

resource "hcloud_server_network" "agent" {
  count = var.agent_count
  server_id = hcloud_server.agent[count.index].id
  network_id = var.network_id
}
