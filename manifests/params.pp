# @summary Default Parameter class
#
# This class contain the default parameter values
#
# @example
#   include openvidu::params
class openvidu::params {
  $docker_repo_install       = true
  $install_path         = '/opt/openvidu'
  $jks_path             = ''
  $jks_store_password   = 'PASSWORD'
  $jks_alias            = 'ALIAS'
  $kms_repo_install     = true
  $kms_version          = '6.13.0'
  $kms_uris             = ''
  $logfile              = '/var/log/openvidu.log'
  $logfile_error        = '/var/log/openvidu_error.log'
  $network_interfaces   = 'eth0'
  $recording            = true
  $recording_autostop   = 0
  $recording_path       = '/opt/openvidu/recording'
  $openvidu_version     = '2.12.0'
  $secret               = 'MY_SECRET'
  $turnserver_enabled   = 1
  $public_port          = 4443
  $public_url           = 'not_set'
  $webhook              = 'false'
  $webhook_headers      = '[\"recording-path:\ /opt/openvidu/recording\"]'
  $webhook_events       = '["recordingStatusChanged"]'
  $webhook_endpoint     = 'http://localhost:8080/api/webhook/recordingStatusChanged'
}
