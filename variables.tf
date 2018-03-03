variable "do_token" {}
variable "ssh_key" {}

variable "domain" {}
variable "region" {}

variable "master_qty" {}
variable "master_size" {}

variable "worker_qty" {}
variable "worker_size" {}

variable "regions" {
    type = "map"
    default = {
        "east" = "nyc3"
        "west" = "sfo2"
    }
}
