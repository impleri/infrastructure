output "addresses" {
  value = "${module.node.addresses}"
}

output "droplets" {
  value = ["${module.node.droplets}"]
}
