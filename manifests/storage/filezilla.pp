# filezilla.pp
# Install FileZilla for OS X, Ubuntu, or Windows
# https://filezilla-project.org
#

class tkhsw::storage::filezilla (
  $ensure = $tkhsw::params::software_ensure,
) inherits tkhsw::params {

  $provider = $facts['os']['name'] ? {
    'Darwin'          => brewcask,
    /(Debian|Ubuntu)/ => undef,
    'windows'         => chocolatey,
    default           => fail("The ${name} class is not supported on ${facts['os']['name']}."),
  }

  package { 'filezilla':
    ensure   => $ensure,
    provider => $provider,
  }
}
