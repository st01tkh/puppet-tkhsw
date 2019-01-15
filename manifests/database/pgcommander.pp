# pgcommander.pp
# Install PG Commander for OS X
# https://eggerapps.at/pgcommander
#
# The next version (in beta currently):
# https://eggerapps.at/postico
#

class tkhsw::database::pgcommander (
  $ensure = $tkhsw::params::software_ensure,
) inherits tkhsw::params {

  case $facts['os']['name'] {
    'Darwin': {
      package { 'pg-commander':
        ensure   => $ensure,
        provider => brewcask,
      }
    }
    default: {
      fail("The ${name} class is not supported on ${facts['os']['name']}.")
    }
  }

}
