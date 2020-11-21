"""Role testing files using testinfra."""


def test_containerd_installed(host):
    containerd = host.file("/usr/bin/ctr")
    assert config.exists
    assert config.user == "root"
    assert config.group == "root"
    assert config.mode == 0o755


def test_containerd_service(host):
    containerd = host.service("containerd")
    assert containerd.is_running
    assert containerd.is_enabled
