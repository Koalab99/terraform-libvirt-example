variable "controller_count" {
    type = number
}

variable "controller_vcpu" {
    type = number
}

variable "controller_memory_mb" {
    type = number
}

variable "base_image_path" {
    type = string
}

variable "base_image_name" {
    type = string
}

variable "ssh_username" {
    type = string
}

variable "ssh_key" {
    type = string
}

variable "root_size_gib" {
    type = number
}

variable "domain_name" {
    type = string
}

variable "internal_cidr" {
    type = string
}

variable "external_cidr" {
    type = string
}

