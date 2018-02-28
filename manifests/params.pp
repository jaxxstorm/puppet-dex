# == Class dex::params
#
# This class is meant to be called from dex
# It sets variables according to platform
#
class dex::params {

  $install_method        = 'package'
  $package_ensure        = 'latest'
  $package_name          = 'dex'
  $config_dir            = '/etc/dex'
  $pretty_config         = true
  $pretty_config_indent  = 4
  $purge_config_dir      = true
  $config_defaults       = {}
  $config_hash           = {}

}
