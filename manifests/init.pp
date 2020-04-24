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
    $jks_path             = $openvidu::params::jks_path,
    $jks_store_password   = $openvidu::params::jks_store_password,
    $jks_alias            = $openvidu::params::jks_alias,
    $kms_version          = $openvidu::params::kms_version,
    $kms_uris             = $openvidu::params::kms_uris,
    $logfile              = $openvidu::params::logfile,
    $logfile_error        = $openvidu::params::logfile_error,
    $public_url           = $openvidu::params::public_url,
    $recording            = $openvidu::params::recording,
    $recording_autostop   = $openvidu::params::recording_autostop,
    $recording_path       = $openvidu::params::recording_path,
    $secret               = $openvidu::params::secret,
    $turnserver_enabled   = $openvidu::params::turnserver_enabled,
  ) inherits openvidu::params {
  contain openvidu::install
  contain openvidu::config
  contain openvidu::services
  Class['openvidu::install'] -> Class['openvidu::config'] -> Class['openvidu::services']
}
