# @summary Default Parameter class
#
# This class contain the default parameter values
#
# @example
#   include openvidu::params
class openvidu::params {
  $install_path         = '/opt/openvidu'
  $kms_version          = '6.13.0'
  $kms_uris             = ["ws://localhost:8888/kurento"]
  $logfile              = '/var/log/openvidu.log'
  $network_interfaces   = 'eth0'
  $recording            = true
  $recording_autostop   = 0
  $recording_path       = '/opt/openvidu/recording'
  $openvidu_version     = '2.12.0'
  $secret               = 'MY_SECRET'
  $turnserver_enabled   = 1
  $public_port          = 4443
}
