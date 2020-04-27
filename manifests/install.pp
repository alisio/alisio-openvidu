# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include openvidu::install
class openvidu::install inherits openvidu {
  if $openvidu::kms_repo_install {
    apt::source { 'kurento':
      location     => "http://ubuntu.openvidu.io/${openvidu::kms_version}",
      release      => $facts['os']['distro']['codename'],
      repos        => 'kms6',
      architecture => $facts['architecture'],
      key          => {
        id     => '5AFA7A83',
        server => 'keyserver.ubuntu.com',
      },
      before       => Package[ 'kurento-media-server','coturn','redis-server','openjdk-8-jre','unzip',]
    }
  }
  if $openvidu::docker_install {
    class {'docker':}
  }
  group { ['openvidu','kurento']:}
  -> user { 'kurento':
    ensure  => present,
    comment => 'Kurento',
    home    => '/home/kurento',
    shell   => '/usr/sbin/nologin',
    groups  => ['kurento','openvidu'],
  }
  -> user { 'openvidu':
    ensure  => present,
    comment => 'openvidu',
    home    => '/home/openvidu',
    shell   => '/usr/sbin/nologin',
  }
  -> package {  [
                'kurento-media-server',
                'coturn',

                'redis-server',
                'openjdk-8-jre',
                'unzip',
              ]:
    ensure => installed,
  }
  -> file { '/etc/systemd/system/openviduserver.service':
    ensure => file,
    source => 'puppet:///modules/openvidu/etc/systemd/system/openviduserver.service',
    mode   => '0644',
  }
  ~> exec { 'Reload daemon control':
    command     => 'systemctl daemon-reload',
    path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    refreshonly => true,
  }
  -> exec { 'Create openvidu install folder':
    command => "mkdir -p ${openvidu::install_path}",
    unless  => "test -d ${openvidu::install_path}",
    path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
  }
  -> file { $openvidu::recording_path :
    ensure => directory,
    mode   => '0770',
    owner  => 'openvidu',
    group  => 'openvidu',
  }
  -> file { '/etc/kurento/modules/kurento' :
    ensure => directory,
  }
  -> archive { "Download openvidu-server-${openvidu::openvidu_version}.jar":
    ensure => present,
    path   => "${openvidu::install_path}/openvidu-server-${openvidu::openvidu_version}.jar",
    source => "http://github.com/OpenVidu/openvidu/releases/download/v${openvidu::openvidu_version}/openvidu-server-${openvidu::openvidu_version}.jar",
  }
}
