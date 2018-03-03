output "addresses" {
  value = "${module.master_node.addresses}"
}

output "droplets" {
  value = ["${module.master_node.droplets}"]
}
