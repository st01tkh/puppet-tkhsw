#
# Audio
#

class tkhsw::audio (
  $ensure = $tkhsw::params::software_ensure,
) inherits tkhsw::params {

  class { '::tkhsw::audio::audacity':
    ensure => $ensure,
  }

}
