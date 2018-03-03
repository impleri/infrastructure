variable "type" {}

variable "region" {}
variable "domain" {
    default = "example.com"
}

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

variable "ssh_key" {}