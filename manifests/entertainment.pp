# entertainment.pp
#
# entertainment group
# Mainly:
#   Video Players
#   Music Players
#   Games
#
#

class tkhsw::entertainment (
  $ensure = $tkhsw::params::software_ensure,
) inherits tkhsw::params {

  class { '::tkhsw::entertainment::vlc':
    ensure => $ensure,
  }

}
