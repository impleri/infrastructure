resource "digitalocean_droplet" "node" {
  count  = "${var.quantity}"
  image  = "coreos-stable"
  name   = "${format("${var.type}-%02d.${var.ingress_name}${var.ingress_name == "" ? "" : "." }${var.domain}", count.index + 1)}"
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
  domain = "${var.domain}"
  type   = "A"
  name   = "${element(digitalocean_droplet.node.*.name, count.index)}"
  value  = "${element(digitalocean_droplet.node.*.ipv4_address, count.index)}"
}
