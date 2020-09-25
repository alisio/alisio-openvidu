# @summary This class configs the openvidu server and dependencies
#
# @example
#   include openvidu::config
class openvidu::config inherits openvidu {
  # contain openvidu::install
  file { '/etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini':
    ensure  => file,
    content => template('openvidu/etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini.erb'),
    mode    => '0644',
  }
  -> file { '/etc/turnserver.conf':
    ensure  => file,
    content => template('openvidu/etc/turnserver.conf.erb'),
    mode    => '0644',
  }
  -> file { '/etc/default/coturn':
    ensure  => file,
    content => template('openvidu//etc/default/coturn.erb'),
    mode    => '0644',
  }
  -> file { '/usr/local/bin/openvidu-server':
    ensure  => file,
    content => template('openvidu/usr/local/bin/openvidu-server.erb'),
    mode    => '0755',
  }
  logrotate::rule { 'openvidu':
    path         => $openvidu::logfile,
    rotate       => 1,
    rotate_every => 'day',
    ifempty      => true,
    dateext      => true,
    maxage       => 7
  }
  logrotate::rule { 'openvidu_error':
    path         => $openvidu::logfile_error,
    rotate       => 1,
    rotate_every => 'day',
    ifempty      => true,
    dateext      => true,
    maxage       => 7
  }
  augeas { 'Set kms run user':
    context => '/files/etc/default/kurento-media-server',
    changes => [
      'set user openvidu',
    ],
  }
}
