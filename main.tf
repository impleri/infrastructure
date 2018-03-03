module "master" {
  source = "./master-node"
  domain = "${var.domain}"
  region = "${var.regions["${var.region}"]}"
  size = "${var.master_size}"
  quantity = "${var.master_qty}"
  ssh_key = "${var.ssh_key}"
}

module "worker" {
  source = "./worker-node"
  domain = "${var.domain}"
  region = "${var.regions["${var.region}"]}"
  size = "${var.worker_size}"
  quantity = "${var.worker_qty}"
  ssh_key = "${var.ssh_key}"
}

resource "digitalocean_loadbalancer" "public" {
  name = "${var.domain}"
  region = "${var.regions["${var.region}"]}"

  forwarding_rule {
    entry_port = 80
    entry_protocol = "http"

    target_port = 80
    target_protocol = "http"
  }

  forwarding_rule {
    entry_port = 443
    entry_protocol = "https"

    target_port = 443
    target_protocol = "https"
    tls_passthrough = true
  }

  healthcheck {
    port = 22
    protocol = "tcp"
  }

  droplet_ids = ["${module.worker.droplets}"]
}