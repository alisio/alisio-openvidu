# @summary This is the main module class
#
# This class installs openvidu-server and dependencies.
#
# @example
#   include openvidu
class openvidu (
    $public_ip,
    $cdr_enable           = $openvidu::params::cdr_enable,
    $network_interfaces   = $openvidu::params::network_interfaces,
    $docker_repo_install  = $openvidu::params::docker_repo_install,
    $install_path         = $openvidu::params::install_path,
    $jks_path             = $openvidu::params::jks_path,
    $jks_store_password   = $openvidu::params::jks_store_password,
    $jks_alias            = $openvidu::params::jks_alias,
    $kms_repo_install     = $openvidu::params::kms_repo_install,
    $kms_version          = $openvidu::params::kms_version,
    $kms_uris             = $openvidu::params::kms_uris,
    $logfile              = $openvidu::params::logfile,
    $logfile_error        = $openvidu::params::logfile_error,
    $openvidu_version     = $openvidu::params::openvidu_version,
    $public_url           = $openvidu::params::public_url,
    $recording            = $openvidu::params::recording,
    $recording_autostop   = $openvidu::params::recording_autostop,
    $recording_path       = $openvidu::params::recording_path,
    $secret               = $openvidu::params::secret,
    $turnserver_enabled   = $openvidu::params::turnserver_enabled,
    $webhook              = $openvidu::params::webhook,
    $webhook_headers      = $openvidu::params::webhook_headers,
    $webhook_events       = $openvidu::params::webhook_events,
    $webhook_endpoint     = $openvidu::params::webhook_endpoint,
  ) inherits openvidu::params {
  contain openvidu::install
  contain openvidu::config
  contain openvidu::services
  Class['openvidu::install'] -> Class['openvidu::config'] -> Class['openvidu::services']
}
