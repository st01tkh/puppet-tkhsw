# pgadmin4.pp
# Install PG Admin 4 for OS X
#

class tkhsw::database::pgadmin4 (
  $ensure = $tkhsw::params::software_ensure,
) inherits tkhsw::params {

  case $facts['os']['name'] {
    'Darwin': {
      package { 'pgadmin4':
        ensure   => $ensure,
        provider => brewcask,
      }
    }
    default: {
      fail("The ${name} class is not supported on ${facts['os']['name']}.")
    }
  }

}
