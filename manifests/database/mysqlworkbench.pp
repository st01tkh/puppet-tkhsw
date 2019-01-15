# mysqlworkbench.pp
# Install MySQL Workbench for OS X, Ubuntu, or Windows
# https://www.mysql.com/products/workbench
# https://dev.mysql.com/downloads/workbench
#

class tkhsw::database::mysqlworkbench (
  $ensure = $tkhsw::params::software_ensure,
) inherits tkhsw::params {

  case $facts['os']['name'] {
    'Darwin': {
      package { 'mysqlworkbench':
        ensure   => $ensure,
        provider => brewcask,
      }
    }
    'Ubuntu': {
      package { 'mysql-workbench':
        ensure => $ensure,
      }
    }
    'windows': {
      package { 'mysql.workbench':
        ensure          => $ensure,
        provider        => chocolatey,
        install_options => ['--allow-empty-checksums'],
      }
    }
    default: {
      fail("The ${name} class is not supported on ${facts['os']['name']}.")
    }
  }

}
