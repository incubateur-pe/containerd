# Tests

The tests use molecule + libvirt + kvm distant + testinfra, allowing on the fly multiple VMs creation and system configuration checks

The simplest way to get a working molecule/vagrant/libvirt environment is to use the docker image ulrichg/molecule-vagrant-libvirt:latest

## Authentication to the distant kvm

Libvirt uses ssh to use the distant qemu socket, so you'll need an ssh public key present on a user on the disatnt kvm server.

This user must have access to the libvirt socket.


__Tests execution with docker:__
```
# interactive :
docker run --env-file molecule/common/env_pe_distant.sh \
    -v ${HOME}/.ssh:/root/.ssh \
    -v $(pwd):/sources/containerd \
    -v ~/.vagrant.d/boxes/:/root/.vagrant.d/boxes/ \
    -w /sources/containerd \
    -it --entrypoint bash \
    ulrichg/molecule-vagrant-libvirt:latest


# Specifying a scenario :
docker run --env-file molecule/common/env_pe.sh \
  -v ${HOME}/.ssh:/root/.ssh \
  -v $(pwd):/sources/containerd \
  -v ~/.vagrant.d/boxes/:/root/.vagrant.d/boxes/ \
  -w /sources/containerd  \
  ulrichg/molecule-vagrant-libvirt:latest \
  test -s distantKvm

# lint:
docker run --env-file molecule/common/env_pe.sh -v $(pwd):/sources/containerd -w /sources/containerd ulrichg/molecule-vagrant-libvirt:latest lint

# default scenario:
docker run --env-file molecule/common/env_local_tests.sh -v $(pwd):/sources/containerd -w /sources/containerd   -v ~/.vagrant.d/boxes/:/root/.vagrant.d/boxes/ ulrichg/molecule-vagrant-libvirt:latest

# other scenario:
docker run --env-file molecule/common/env_local_tests.sh -v $(pwd):/sources/containerd -w /sources/containerd   -v ~/.vagrant.d/boxes/:/root/.vagrant.d/boxes/  ulrichg/molecule-vagrant-libvirt:latest test -s scenario
```


## Local kvm execution

To use a local kvm, you need to mount the socket into the docker container by adding to the command line :

`-v /var/run/libvirt/libvirt-sock:/var/run/libvirt/libvirt-sock`