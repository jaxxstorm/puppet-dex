# == Class dex::config
#
# This class is called from dex::init to install the config file.
#
# == Parameters
#
# [*config_hash*]
#   Hash for Dex to be deployed as JSON
#
# [*purge*]
#   Bool. If set will make puppet remove stale config files.
#
class dex::config(
  $config_hash,
  $purge = true,
) {


  file { '/lib/systemd/system/dex.service':
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('dex/dex.systemd.erb'),
  }
  ~> exec { 'dex-systemd-reload':
    command     => 'systemctl daemon-reload',
    path        => [ '/usr/bin', '/bin', '/usr/sbin' ],
    refreshonly => true,
  }


  file { $dex::config_dir:
    ensure  => directory,
    purge   => $purge,
    recurse => $purge,
  }
  -> file { 'dex config.json':
    ensure  => present,
    path    => "${dex::config_dir}/config.json",
    content => dex_sorted_json($config_hash, $::dex::pretty_config, $::dex::pretty_config_indent),
    notify  => Service['dex'],
    require => File[$::dex::config_dir],
  }

}
