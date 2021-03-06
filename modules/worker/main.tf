resource "digitalocean_tag" "worker" {
  name = "worker"
}

module "node" {
  source = "../node"
  type = "worker"
  domain = "${var.domain}"
  ingress_name = "${var.ingress_name}"
  region = "${var.region}"
  size = "${var.size}"
  quantity = "${var.quantity}"
  ssh_key = "${var.ssh_key}"
  tags = ["${digitalocean_tag.worker.id}"]
}