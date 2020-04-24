# This manifest is intended to be used with the included vagrant file
class {'openvidu':
  public_ip          => '192.168.33.10',
  kms_uris           => '["ws://192.168.33.11:8888/kurento"]',
  network_interfaces => 'enp0s8',
  secret             => 'secret',
}
