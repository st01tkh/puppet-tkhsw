# sequelpro.pp
# Install Sequel Pro for OS X
# http://www.sequelpro.com
#

class tkhsw::database::sequelpro (
  $ensure = $tkhsw::params::software_ensure,
) inherits tkhsw::params {

  case $facts['os']['name'] {
    'Darwin': {
      package { 'sequel-pro':
        ensure   => $ensure,
        provider => brewcask,
      }
    }
    default: {
      fail("The ${name} class is not supported on ${facts['os']['name']}.")
    }
  }

}
