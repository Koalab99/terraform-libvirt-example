resource "libvirt_domain" "controller" {
    count = var.controller_count
    name  = "controller-${ count.index }"
    vcpu  = var.controller_vcpu
    memory = var.controller_memory_mb

    # had to add this or the boot process would be stuck at probing EDD.
    cpu {
        mode = "host-passthrough"
    }

    disk {
        volume_id = libvirt_volume.controllers[count.index].id
    }

    cloudinit = libvirt_cloudinit_disk.cloud-init-controller[count.index].id

    network_interface {
        network_id     = libvirt_network.internal.id
        hostname       = "controller-${ count.index }"
        wait_for_lease = true
    }

    network_interface {
        network_id     = libvirt_network.external.id
        hostname       = "controller-${ count.index }"
        wait_for_lease = true
    }
}
