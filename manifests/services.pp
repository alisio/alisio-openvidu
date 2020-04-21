# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include openvidu::services
class openvidu::services inherits openvidu {
  contain openvidu::config
  service { [
      'redis-server',
      'coturn',
      'kurento-media-server'
    ]:
    ensure => running,
    enable => true,
    hasrestart => true,
    hasstatus  => true,
    # pattern => 'name',
  }
}
