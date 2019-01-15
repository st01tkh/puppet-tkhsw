# openconnect.pp
# Install Open Client for Cisco AnyConnect VPN for OS X or Ubuntu
# Also installs the Network Management Plugin for graphical configuration
#

class tkhsw::utilities::openconnect (
  $ensure = $tkhsw::params::software_ensure,
) inherits tkhsw::params {

  case $facts['os']['name'] {
    'Darwin': {
      package { 'openconnect':
        ensure   => $ensure,
        provider => brew,
      }
    }
    'Ubuntu': {
      package { 'network-manager-openconnect-gnome':
        ensure => $ensure,
      }
    }
    default: {
      fail("The ${name} class is not supported on ${facts['os']['name']}.")
    }
  }

}
