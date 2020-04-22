# @summary This is the main module class
#
# This class installs openvidu-server and dependencies.
#
# @example
#   include openvidu
class openvidu (
    $public_ip,
    $network_interfaces   = $openvidu::params::network_interfaces,
    $install_path         = $openvidu::params::install_path,
    $kms_version          = $openvidu::params::kms_version,
    $logfile              = $openvidu::params::logfile,
    $recording            = $openvidu::params::recording,
    $recording_autostop   = $openvidu::params::recording_autostop,
    $recording_path       = $openvidu::params::recording_path,
    $secret               = $openvidu::params::secret,
    $turnserver_enabled   = $openvidu::params::turnserver_enabled,
  ) inherits openvidu::params {
  contain 'openvidu::services'
}

Class['openvidu::install']
-> Class['openvidu::config']
->  Class['openvidu::service']
