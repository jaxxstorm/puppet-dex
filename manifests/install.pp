# === Class dex::install
#
# Installs dex based on parameters passed
#
class dex::install {

  case $dex::install_method {

    'docker': {
      # Do nothing
    }
    'package': {
      package { $dex::package_name:
        ensure => $dex::package_ensure,
      }
    }
    default: {
      fail("The provided install method ${dex::install_method} is invalid")
    }
  }

}
