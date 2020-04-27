# This manifest is intended to be used with the included vagrant file
class {'openvidu':
  public_ip          => '192.168.33.10',
  network_interfaces => 'enp0s8',
  secret             => 'secret',
  kms_repo_install   => false,
  docker_install     => false,
}
