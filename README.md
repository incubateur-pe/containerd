![pipeline_status](https://gitlab.com/incubateur-pe/containerd/badges/dev/pipeline.svg)

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
| containerd_registry_configs[*].{{section}}.{{key}}.{{value}} | N/A | Configure registry section with key and value |
| containerd_cni_bin_dir | fedora : /usr/libexec/cni, others: /opt/cni/bin | CNI drivers binary directory |
| containerd_cni_conf_dir | /etc/cni/net.d | cni drivers configuration directory |
| docker_apt_ignore_key_error | true | Ignore errors on gpg key import |
| containerd_repo_valid_ssl | true | Set to false to use a repository with for example a self signed certifcate |
| containerd_restart_disruption_budget | 20 | Maximum number of parallel restarts |
| containerd_repo_address | {{ containerd_repo | regex_replace("/$", "") }}/{{ ansible_distribution | lower }} | Containerd repository address |
| containerd_service_slice | N/A | Cgroup slice to run containerd |
| containerd_shim_slice | N/A | Cgroup path to execute containers |
| containerd_daemon_slice | N/A | Cgroup path to execute containerd daemon 
| containerd_systemd_cgroup | N/A | Cgroup driver systemd active |

Example Playbook
----------------

Simple containerd install:

```yaml
- hosts: all
  roles:
  - role: 'containerd'
```

Registry configuration example :

```yaml
- hosts: all
  tasks:
    roles:
    - role: "containerd"
  vars:
    containerd_registry_mirrors:
      - name: test.local
        endpoint:
        - https://repository_address
      - name: docker.io
        endpoint:
        - http://docker_io_mirror.local
    containerd_registry_configs:
      - name: test.local
        tls:
          insecure_skip_verify: true
        auth:
          username: fakeUser
          password: fakePassword
          auth: "{{ ('fakeUser:fakePassword') | b64encode }}"
          identitytoken: "token"
```

Tests
-----

See tests.md

License
-------

BSD 3-Clause
