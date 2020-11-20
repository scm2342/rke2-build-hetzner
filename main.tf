module "clusterbase" {
  clustername = var.clustername
  source = "./clusterbase"
  hcloud_token = var.hcloud_token
}
module "masterpool" {
  source = "./masterpool"
  hcloud_token = var.hcloud_token
  rke2_cluster_secret = var.rke2_cluster_secret
  clustername = var.clustername
  lb_ip = module.clusterbase.lb_ip
  ssh_keys = [hcloud_ssh_key.root.name]
  network_id = module.clusterbase.network_id
  domains = [var.domain]
}
module "agentpool" {
  source = "./agentpool"
  hcloud_token = var.hcloud_token
  rke2_cluster_secret = var.rke2_cluster_secret
  clustername = var.clustername
  lb_ip = module.clusterbase.lb_ip
  ssh_keys = [hcloud_ssh_key.root.name]
  network_id = module.clusterbase.network_id
}
