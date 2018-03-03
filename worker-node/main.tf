module "worker_node" {
  source = "../swarm-node"
  type = "worker"
  domain = "${var.domain}"
  region = "${var.region}"
  size = "${var.size}"
  quantity = "${var.quantity}"
  ssh_key = "${var.ssh_key}"
}