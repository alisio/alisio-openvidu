# @summary Manage the openvidu related services
#
# A description of what this class does
#
# @example
#   include openvidu::services
class openvidu::services inherits openvidu {
  # contain openvidu::config
  service { [
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
  }
}
