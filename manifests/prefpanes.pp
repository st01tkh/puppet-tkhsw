# prefpanes.pp
#
# prefpanes group
# Add System Preferences Preference Panes
#
#

class tkhsw::prefpanes (
  $ensure = $tkhsw::params::software_ensure,
) inherits tkhsw::params {

  class { '::tkhsw::prefpanes::launchrocket':
    ensure => $ensure,
  }

}
