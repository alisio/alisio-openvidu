# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include openvidu::config
class openvidu::config inherits openvidu {
  contain openvidu::install
  file { '/etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini':
    ensure => file,
    content => template('openvidu/etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini.erb'),
    mode => '0644',
  }
  file { '/etc/turnserver.conf':
    ensure => file,
    content => template('openvidu/etc/turnserver.conf.erb'),
    mode => '0644',
  }
  file { '/etc/default/coturn':
    ensure => file,
    content => template('openvidu//etc/default/coturn.erb'),
    mode => '0644',
  }
}
