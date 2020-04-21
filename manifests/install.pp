# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include openvidu::install
class openvidu::install inherits openvidu {
  apt::source { 'kurento':
    location => "http://ubuntu.openvidu.io/${kms_version}",
    release       => $facts['os']['distro']['codename'],
    repos         => 'kms6',
    architecture  => $facts['architecture'],
    key           => {
      id          => '5AFA7A83',
      server      => 'keyserver.ubuntu.com',
    },
  } ->
  user { 'kurento':
    comment => 'Kurento',
    home => '/home/kurento',
    ensure => present,
    shell => '/usr/sbin/nologin',
    # uid => '501',
    # gid => '20',
  } ->
  package {  [
                'kurento-media-server',
                'coturn',
                'redis-server',
                'openjdk-8-jre'
              ]:
    ensure => installed,
  }
  file { '/usr/local/bin/openvidu-server':
    ensure => file,
    content => template('openvidu/usr/local/bin/openvidu-server.erb'),
    mode => '0755',
  }
  file { '/opt/openvidu-server':
    ensure => directory,
    content => template('openvidu/usr/local/bin/openvidu-server.erb'),
    mode => '0755',
  }
}
