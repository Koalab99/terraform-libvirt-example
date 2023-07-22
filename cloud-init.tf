resource "libvirt_cloudinit_disk" "cloud-init-controller" {
    count     = var.controller_count
    name      = "cloud-init-controller-${count.index}.iso"
    user_data = templatefile(
        "${ path.module }/cloud-init.template",
        {
            hostname = "controller-${count.index}"
            ssh_user = var.ssh_username
            ssh_key = var.ssh_key
            domain = var.domain_name
        }
    )
}
