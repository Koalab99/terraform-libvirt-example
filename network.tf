resource "libvirt_network" "internal" {
    name = "internal"
    mode = "none"
    domain = "internal.${var.domain_name}"
    addresses = [ var.internal_cidr ]
    dhcp {
        enabled = true
    }
}

resource "libvirt_network" "external" {
    name = "external"
    mode = "nat"
    addresses = [ var.external_cidr ]
    domain = "external.${var.domain_name}"
    dhcp {
        enabled = true
    }
}
