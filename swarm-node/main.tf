resource "digitalocean_droplet" "node" {
  count  = "${var.quantity}"
  image  = "coreos-stable"
  name   = "${format("${var.type}-%02d.${var.domain}", count.index + 1)}"
  region = "${var.region}"
  size   = "${var.sizes["${var.size}"]}"
  ssh_keys = ["${var.ssh_key}"]
  user_data = "${file("${path.module}/ignition.json")}"
}
