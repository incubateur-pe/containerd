DOCKER_YUM_MIRROR=https://download.docker.com/linux/
DOCKER_APT_MIRROR=https://download.docker.com/linux/
REMOTE_HOST=true
PROVIDER_ARGS=['host="iugi3000-HP-ProDesk-400-G4-MT.dgasi.pole-emploi.intra"', 'username="libvirt-user"']
SSH_CONFIG=ssh_config_pe
SSH_ARGS=-o ProxyCommand="ssh -W %h:%p -q -l libvirt-user iugi3000-HP-ProDesk-400-G4-MT.dgasi.pole-emploi.intra"
http_proxy
https_proxy
HTTP_PROXY
HTTPS_PROXY
no_proxy
NO_PROXY
