# Terraform + dmacvicar/libvirt provider example

This repo aims at providing an example of how [dmacvicar/libvirt](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs) provider can work on a local machine.

By default, it will create `n` machines named from `controller-0` to `controller-n`.
Setup one disk per machine from a base image (which should have cloud-init installed to work properly)
Connect each machine to two virtual networks (internal and external)
Add cloud-init cdrom to provide basic configuration of the instances (default user, ssh autorized key and hostname)

## Configuration
A sample configuration is provided in `myvars.tfvars` and can be applied using the command:

```
terraform apply -var-file myvars.tfvars
```
and you can delete the installed infrastructure with:
```
terraform destroy -var-file myvars.tfvars
```

## Troubleshoot
I run this on a debian system. Some configuration parts are probably different for you.

### Default user
### security_driver
Debian based distros can encounter errors when applying the terraform. It is probably due to the apparmor being misconfigured (probably by the upstream for your defense).
You can avoid this issue by setting this line in `/etc/libvirt/qemu.conf`:
```
security_driver = 'none'
```
### group
If you are running terraform as a non-root user, you should be part of the group `libvirt` or `libvirtd` depending on your OS.

A way to find informations:
```
# get all group containing libvirt
getent group | grep libvirt

# get a list of all your groups
groups

# Add the group "libvirt" to your user
sudo usermod -aG libvirt $(whoami)
```

### Virsh URI
If using virsh command line tool as non-root user, `virsh list` is probably not showing you your instances.

The provider configuration uses `qemu:///system` and your user is probably using `qemu:///session`.

To get access to the virsh command you should be part of the group and export the environment variable:
```
export LIBVIRT_DEFAULT_URI="qemu:///system"
```
If you want this to be persistent you can add it to your `~/.bashrc` or something similar.
