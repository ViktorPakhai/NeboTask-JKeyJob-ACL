variable "destinationCIDRblock" {
    default = "0.0.0.0/0"
}

variable "ingressCIDRblock" {
    type = list
    default = [ "92.52.178.146/32" ]
}

variable "egressCIDRblock" {
    type = list
    default = [ "92.52.178.146/32" ]
}