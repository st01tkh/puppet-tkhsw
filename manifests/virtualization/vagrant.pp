# vagrant.pp
# Install Vagrant for OS X, Ubuntu, or Windows
# https://www.vagrantup.com/
#
#

class tkhsw::virtualization::vagrant (
  $ensure = $tkhsw::params::software_ensure,
) inherits tkhsw::params {

  case $facts['os']['name'] {
    'Darwin': {
      package { 'vagrant':
        ensure   => $ensure,
        provider => brewcask,
      }
    }
    'Ubuntu': {
      include '::vagrant'
    }
    'windows': {
      package { 'vagrant':
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
