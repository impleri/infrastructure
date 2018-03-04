locals {
  instance = "${var.type}-%02d.${var.ingress_name}"
}

resource "digitalocean_droplet" "node" {
  count  = "${var.quantity}"
  image  = "coreos-stable"
  name   = "${format("${local.instance}${var.ingress_name == "" ? "" : "." }${var.domain}", count.index + 1)}"
  region = "${var.region}"
  size   = "${var.sizes["${var.size}"]}"
  ssh_keys = ["${var.ssh_key}"]
  tags = ["${var.tags}"]
  user_data = "${file("${path.module}/ignition.json")}"
  lifecycle = {
    create_before_destroy = true
  }
}

resource "digitalocean_record" "node" {
  count  = "${var.quantity}"
  domain = "${var.domain}"
  type   = "A"
  name   = "${format("${local.instance}", count.index + 1)}"
  value  = "${element(digitalocean_droplet.node.*.ipv4_address, count.index)}"
}
