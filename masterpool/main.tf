resource "hcloud_server" "master" {
  count = var.master_count
  name = "${var.clustername}-master-${count.index}"
  location = var.location
  image = "ubuntu-20.04"
  server_type = var.master_type
  labels = {
    cluster: var.clustername,
    master: "true"
  }
  backups = true
  ssh_keys = var.ssh_keys
  user_data = templatefile("${path.module}/server_userdata.tmpl", {
    extra_ssh_keys = var.extra_ssh_keys,
    rke2_cluster_secret = var.rke2_cluster_secret,
    lb_address = var.lb_ip
    master_index = count.index,
    rke2_version = var.rke2_version,
    domains = var.domains,
    clustername = var.clustername,
    lb_id = var.lb_id,
    api_token = var.api_token
  })
}

resource "hcloud_server_network" "master" {
  count = var.master_count
  server_id = hcloud_server.master[count.index].id
  network_id = var.network_id
}
