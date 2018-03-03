resource "digitalocean_tag" "master" {
  name = "master"
}

module "master_node" {
  source = "../swarm-node"
  type = "master"
  domain = "${var.domain}"
  region = "${var.region}"
  size = "${var.size}"
  quantity = "${var.quantity}"
  ssh_key = "${var.ssh_key}"
  tags = ["${digitalocean_tag.master.id}"]
}

resource "null_resource" "swarm_init" {
  triggers {
    first_master = "${element(module.master_node.addresses, 0)}"
  }

  connection {
    host = "${element(module.master_node.addresses, 0)}"
    user = "core"
    private_key = "${file("${var.ssh_keyfile}")}"
  }

  provisioner "remote-exec" {
    inline = [
      "docker swarm init --advertise-addr ${element(module.master_node.addresses, 0)}",
    ]
  }
}