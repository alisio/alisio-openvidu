# @summary Manage the openvidu related services
#
# A description of what this class does
#
# @example
#   include openvidu::services
class openvidu::services inherits openvidu {
  service { 'docker':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
  -> service { [
      'redis-server',
      'coturn',
      'kurento-media-server',
    ]:
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
  -> service { 'openviduserver':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    subscribe  => File['/usr/local/bin/openvidu-server']
  }
}
