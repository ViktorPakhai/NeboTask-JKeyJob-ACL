variable "destinationCIDRblock" {
  default = "92.52.178.0/24"
}

variable "ingressCIDRblock" {
  type    = list(any)
  default = ["92.52.178.0/24"]
}

variable "egressCIDRblock" {
  type    = list(any)
  default = ["92.52.178.0/24"]
}