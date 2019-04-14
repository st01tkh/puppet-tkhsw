# 
# Development 
#

class tkhsw::develop(
  $ensure = $tkhsw::params::software_ensure,
) inherits tkhsw::params {

  class { '::tkhsw::develop::yamllint':
    ensure => $ensure,
  }

}
