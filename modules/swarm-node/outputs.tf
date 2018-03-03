output "addresses" {
  value = ["${digitalocean_droplet.node.*.ipv4_address}"]
}

output "droplets" {
  value = ["${digitalocean_droplet.node.*.id}"]
}
