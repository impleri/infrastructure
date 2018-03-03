module "master_node" {
  source = "../swarm-node"
  type = "master"
  domain = "${var.domain}"
  region = "${var.region}"
  size = "${var.size}"
  quantity = "${var.quantity}"
  ssh_key = "${var.ssh_key}"
}