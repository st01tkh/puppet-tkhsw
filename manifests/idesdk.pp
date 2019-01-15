# idesdk.pp
#
# idesdk group
# Mainly:
#   Integrated Development Environment
#   Software Development Kit
#
#

class tkhsw::idesdk (
  $ensure = $tkhsw::params::software_ensure,
) inherits tkhsw::params {

  class { '::tkhsw::idesdk::android_studio':
    ensure => $ensure,
  }

  class { '::tkhsw::idesdk::android_tools':
    ensure => $ensure,
  }

}
