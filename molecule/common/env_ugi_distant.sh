DOCKER_YUM_MIRROR=http://10.0.4.40:8081/repository/docker-yum
DOCKER_APT_MIRROR=http://10.0.4.40:8081/repository/docker-yum
REMOTE_HOST=true
PROVIDER_ARGS=['host="kvm"', 'username="libvirt-user"']
SSH_CONFIG=ssh_config_ugi
SSH_ARGS=-o ProxyCommand="ssh -W %h:%p -q -l libvirt-user kvm"
