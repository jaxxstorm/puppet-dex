# == Class dex::service
#
# This class is meant to be called from dex::init
# It ensure the service is running
#
class dex::service {

    service { 'dex':
      ensure   => $dex::service_ensure,
      enable   => $dex::service_enable,
    }
}
