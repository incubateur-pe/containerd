containerd
=========

Install and configure containerd

Role Variables
--------------

| Nom | valeur par defaut | description |
|-----|-------------------|-------------|
| containerd_repo | https://download.docker.com/linux/ | containerd repository (or mirror to) containing packages |
| containerd_data_root | /var/lib/docker | containerd data directory  |
| containerd_registry_mirrors | [] | Registries to configure as mirrors |
| containerd_registry_mirrors[*].name | N/A | Name of the registry, example: gcr.io |
| containerd_registry_mirrors[*].endpoint[] | N/A | endpoints of the registry, example: ["https://gcr.io"] |
| containerd_registry_mirrors[*].skip_ssl_verify | N/A | whether to trust a self signed certificate on this mirror |
| docker_apt_ignore_key_error | true | Ignore errors on gpg key import |
| docker_repo_valid_ssl | true | Set to false to use a repository with for example a self signed certifcate |

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
