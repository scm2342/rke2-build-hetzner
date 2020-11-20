resource "hcloud_server" "master" {
  count = var.server_count
  name = "clustername-master-${count.index}"
  location = "nbg1"
  image = "ubuntu-20.04"
  server_type = "cx21-ceph"
  labels = {
    cluster: "clustername",
    master: "true"
  }
  backups = true
  ssh_keys = [hcloud_ssh_key.root.id]
  user_data = templatefile("${path.cwd}/files/server_userdata.tmpl", {
    extra_ssh_keys = var.extra_ssh_keys,
    rke2_cluster_secret = var.rke2_cluster_secret,
    lb_address = hcloud_load_balancer_network.clustername.ip,
    master_index = count.index,
    rke2_version = var.rke2_version
  })
}

resource "hcloud_server_network" "master" {
  count = var.server_count
  server_id = hcloud_server.master[count.index].id
  network_id = hcloud_network.clustername.id
}
