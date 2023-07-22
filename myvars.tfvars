# The number of controller to spawn
controller_count = 3
# The number of vcpu per controller
controller_vcpu = 2

# The amount of memory per controller in MiB
controller_memory_mb = 4096

# Where we should get the base image (can be url or file)
base_image_path = "/home/corentin/Downloads/Rocky-9-GenericCloud-Base.latest.x86_64.qcow2"

# The name of the base image (showed in "virsh vol-list default")
base_image_name = "rocky-cloud-image"

# The username which will be created on the servers with sudo rights and ssh key connection
ssh_username = "admsrv"

# The ssh key for the user above
ssh_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ7LWziAjXD+Ds3N/eniBfUjj6Rn1l8hmOLKpA2tSZAa"

# root disk size must be greater or equal to the base image
root_size_gib = 20

# The domain of the servers
domain_name = "localdomain"

# The CIDR for the internal network (inter machine communication)
internal_cidr = "172.16.18.0/24"

# The CIDR for the external network (NATed, with a gateway and access to your hypervisor's network)
external_cidr = "10.0.10.0/24"


