# synaptic.pp
# Install Synaptic Package Manager for Ubuntu
#

class tkhsw::utilities::synaptic (
  $ensure = $tkhsw::params::software_ensure,
) inherits tkhsw::params {

  case $facts['os']['name'] {
    'Ubuntu': {
      package { 'synaptic':
        ensure => $ensure,
      }
    }
    default: {
      fail("The ${name} class is not supported on ${facts['os']['name']}.")
    }
  }

}
