containerd
=========

Install and configure containerd

Role Variables
--------------

| Nom | valeur par defaut | description |
|-----|-------------------|-------------|
| containerd_repo | https://download.docker.com/linux/ | containerd repository (or mirror to) containing packages |
| containerd_data_root | /var/lib/containerd | containerd data directory  |
| containerd_registry_mirrors | [] | Registries to configure as mirrors |
| containerd_registry_mirrors[*].name | N/A | Name of the registry, example: gcr.io |
| containerd_registry_mirrors[*].endpoint[] | N/A | endpoints of the registry, example: ["https://gcr.io"] |
| containerd_registry_configs[*].name | N/A | Name of the registry, example: gcr.io |
| containerd_registry_configs[*].tls.skip_ssl_verify | N/A | whether to trust a self signed certificate on this mirror |
| containerd_registry_configs[*].auth.username | N/A | Auth username for remote repository |
| containerd_registry_configs[*].auth.password | N/A | Auth password for remote repository |
| containerd_registry_configs[*].auth.auth | N/A | Auth b64 encoded, like in docker config.json |
| containerd_registry_configs[*].auth.identitytoken | N/A | Ath identity token |
| containerd_cni_bin_dir | fedora : /usr/libexec/cni, others: /opt/cni/bin | CNI drivers binary directory |
| containerd_cni_conf_dir | /etc/cni/net.d | cni drivers configuration directory |
| docker_apt_ignore_key_error | true | Ignore errors on gpg key import |
| containerd_repo_valid_ssl | true | Set to false to use a repository with for example a self signed certifcate |

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

See tests.md

License
-------

BSD 3-Clause
