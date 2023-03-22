variable "destinationCIDRblock" {
    default = "92.52.178.0/24"
}

variable "ingressCIDRblock" {
    type = list
    default = [ "92.52.178.0/24" ]
}

variable "egressCIDRblock" {
    type = list
    default = [ "92.52.178.0/24" ]
}