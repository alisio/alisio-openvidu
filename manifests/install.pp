# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include openvidu::install
class openvidu::install inherits openvidu {
  $packages = ['kurento-media-server','coturn','redis-server','openjdk-8-jre','unzip']
  $packages_docker = [
    'apt-transport-https','ca-certificates','curl','gnupg-agent',
    'software-properties-common','docker-ce','docker-ce-cli','containerd.io'
  ]

  if $openvidu::kms_repo_install {
    apt::source { 'kurento':
      location     => "http://ubuntu.openvidu.io/${openvidu::kms_version}",
      release      => $facts['os']['distro']['codename'],
      repos        => 'kms6',
      architecture => $facts['architecture'],
      key          => {
        id     => '234821A61B67740F89BFD669FC8A16625AFA7A83',
        server => 'keyserver.ubuntu.com',
      },
      notify       => Exec['apt_update']
    }
  }
  if $openvidu::docker_repo_install {
    apt::source { 'docker':
      location     => 'http://download.docker.com/linux/ubuntu',
      release      => $facts['os']['distro']['codename'],
      repos        => 'stable',
      architecture => $facts['architecture'],
      key          => {
        id     => '9DC858229FC7DD38854AE2D88D81803C0EBFCD88',
        server => 'keyserver.ubuntu.com',
      },
      notify       => Exec['apt_update']
    }
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
    notify  => Package[$packages],
  }
  if $openvidu::kms_repo_install or $openvidu::docker_repo_install {
    package { $packages:
      ensure  => installed,
      require => Exec['apt_update'],
    }
  } else {
    package { $packages:
      ensure  => installed,
    }
  }
  -> package { $packages_docker:
    ensure  => installed,
    require => Package[$packages],
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
