resource "digitalocean_tag" "manager" {
  name = "manager"
}

module "node" {
  source = "../node"
  type = "manager"
  domain = "${var.domain}"
  region = "${var.region}"
  size = "${var.size}"
  quantity = "${var.quantity}"
  ssh_key = "${var.ssh_key}"
  tags = ["${digitalocean_tag.manager.id}"]
}

resource "null_resource" "swarm_init" {
  triggers {
    first_manager = "${element(module.node.addresses, 0)}"
  }

  connection {
    host = "${element(module.node.addresses, 0)}"
    user = "core"
    private_key = "${file("${var.ssh_keyfile}")}"
  }

  provisioner "remote-exec" {
    inline = [
      "docker swarm init --advertise-addr ${element(module.node.addresses, 0)}",
    ]
  }
}