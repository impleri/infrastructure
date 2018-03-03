variable "ssh_keyfile" {}

variable "do_token" {}
variable "ssh_key" {}

variable "domain" {}
variable "region" {}

variable "manager_qty" {}
variable "manager_size" {}

variable "worker_qty" {}
variable "worker_size" {}

variable "regions" {
    type = "map"
    default = {
        "east" = "nyc3"
        "west" = "sfo2"
    }
}
