resource "libvirt_volume" "base_image" {
    name   = var.base_image_name
    source = var.base_image_path
}

resource "libvirt_volume" "controllers" {
    count = 3
    name  = "controller-${ count.index }-root"
    base_volume_id = libvirt_volume.base_image.id
    # Size must be greater or equal to the size of the base image
    size = var.root_size_gib * 1024 * 1024 * 1024
}
