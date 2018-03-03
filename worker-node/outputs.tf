output "addresses" {
  value = "${module.worker_node.addresses}"
}

output "droplets" {
  value = ["${module.worker_node.droplets}"]
}
