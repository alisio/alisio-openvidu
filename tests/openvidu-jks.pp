# This manifest is intended to be used with the included vagrant file
class {'openvidu':
  public_ip          => '192.168.33.10',
  network_interfaces => 'enp0s8',
  secret             => 'secret',
  jks_alias          => 'conferencia3.serpro.gov.br',
  jks_store_password => 'jkspassword',
  jks_path           => '/opt/openvidu-server/openvidu.jks',
}
