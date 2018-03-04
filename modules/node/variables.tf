variable "type" {}

variable "region" {}
variable "domain" {
    default = "example.com"
}

variable "ingress_name" {}

variable "size" {}
variable "sizes" {
    type = "map"
    default = {
        "small" = "s-1vcpu-1gb"
        "medium" = "s-1vcpu-2gb"
        "large" = "s-2vcpu-4gb"
    }
}

variable "quantity" {
    default = "1"
}

variable "tags" {
    type = "list"
}

variable "ssh_key" {}