containerd
=========

Install and configure containerd

Role Variables
--------------

| Nom | valeur par defaut | description |
|-----|-------------------|-------------|
| containerd_repo | https://download.docker.com/linux/ | containerd repository (or mirror to) containing packages |

Example Playbook
----------------

Simple containerd install:

```yaml
- hosts: all
  roles:
  - role: 'containerd'
```


Tests
-----

The tests use molecule + libvirt + kvm distant + testinfra, allowing on the fly multi-nodes clusters creation and system configuration checks

__Tests execution with docker:__
```
# interactive :
docker run -v $(pwd):/sources/containerd -w /sources/containerd   -v ~/.vagrant.d/boxes/:/root/.vagrant.d/boxes/   -v /var/run/libvirt/libvirt-sock:/var/run/libvirt/libvirt-sock -it --entrypoint bash ulrichg/molecule-vagrant-libvirt:latest

# lint:
docker run -v $(pwd):/sources/containerd -w /sources/containerd   -v ~/.vagrant.d/boxes/:/root/.vagrant.d/boxes/   -v /var/run/libvirt/libvirt-sock:/var/run/libvirt/libvirt-sock ulrichg/molecule-vagrant-libvirt:latest lint

# default scenario:
docker run -v $(pwd):/sources/containerd -w /sources/containerd   -v ~/.vagrant.d/boxes/:/root/.vagrant.d/boxes/   -v /var/run/libvirt/libvirt-sock:/var/run/libvirt/libvirt-sock ulrichg/molecule-vagrant-libvirt:latest

# other scenario:
docker run -v $(pwd):/sources/containerd -w /sources/containerd   -v ~/.vagrant.d/boxes/:/root/.vagrant.d/boxes/   -v /var/run/libvirt/libvirt-sock:/var/run/libvirt/libvirt-sock ulrichg/molecule-vagrant-libvirt:latest test -s scenario
```

License
-------

BSD 3-Clause
