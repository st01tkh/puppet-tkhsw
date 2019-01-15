# utilities.pp
#
# utilities group
#
#

class tkhsw::utilities (
  $ensure = $tkhsw::params::software_ensure,
) inherits tkhsw::params {

  class { '::tkhsw::utilities::controlplane':
    ensure => $ensure,
  }

  class { '::tkhsw::utilities::iterm':
    ensure => $ensure,
  }

  class { '::tkhsw::utilities::onyx':
    ensure => $ensure,
  }

}
