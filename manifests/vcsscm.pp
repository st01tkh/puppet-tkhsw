# vcsscm.pp
#
# vcsscm group
# Version Control Systems
# Software Configuration Management
# Mainly repo editors/managers/visualizers for git and the like
#
#

class tkhsw::vcsscm (
  $ensure = $tkhsw::params::software_ensure,
) inherits tkhsw::params {

  class { '::tkhsw::vcsscm::sourcetree':
    ensure => $ensure,
  }

}
