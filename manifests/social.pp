# social.pp
#
# social group
# Chat/Messaging
#
#

class tkhsw::social (
  $ensure = $tkhsw::params::software_ensure,
) inherits tkhsw::params {

  class { '::tkhsw::social::skype':
    ensure => $ensure,
  }

  class { '::tkhsw::social::slack':
    ensure => $ensure,
  }

}
