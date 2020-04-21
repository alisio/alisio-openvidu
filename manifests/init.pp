# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include openvidu
class openvidu (
    $public_ip,
    $network_interfaces,
    $kms_version          = $openvidu::params::kms_version,
  ) inherits openvidu::params {
  contain openvidu::services
}
