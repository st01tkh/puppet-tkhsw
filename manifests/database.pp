# database.pp
#
# database group
# Mainly graphical database editors for MySQL and PostgreSQL
#
#

class tkhsw::database (
  $ensure = $tkhsw::params::software_ensure,
) inherits tkhsw::params {

  class { '::tkhsw::database::mysqlworkbench':
    ensure => $ensure,
  }

  class { '::tkhsw::database::pgcommander':
    ensure => $ensure,
  }

  class { '::tkhsw::database::pgadmin4':
    ensure => $ensure,
  }

  class { '::tkhsw::database::sequelpro':
    ensure => $ensure,
  }

}
