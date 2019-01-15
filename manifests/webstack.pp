# webstack.pp
#
# webstack group
# Mainly:
#   Servers to run web apps locally on Mac
#   Zero config Rack server for rails/php apps
#
#

class tkhsw::webstack (
  $ensure = $tkhsw::params::software_ensure,
) inherits tkhsw::params {

  class { '::tkhsw::webstack::anvil':
    ensure => $ensure,
  }

}
