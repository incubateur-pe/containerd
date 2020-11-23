"""Role testing files using testinfra."""


def test_containerd_installed(host):
    containerd = host.file("/usr/bin/containerd")
    assert containerd.exists
    assert containerd.user == "root"
    assert containerd.group == "root"
    assert containerd.mode == 0o755


def test_containerd_service(host):
    containerd = host.service("containerd")
    assert containerd.is_running
    assert containerd.is_enabled

def test_containerd_config(host):
    config = host.file("/etc/containerd/config.toml")
    assert config.exists
    assert config.contains("http://10.0.4.40:5005")
    assert config.contains("insecure_skip_verify")
