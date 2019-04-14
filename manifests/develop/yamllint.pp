#
# YAML Linter
#

class tkhsw::develop::yamllint(
  $ensure = $tkhsw::params::software_ensure,
) inherits tkhsw::params {

  $provider = $facts['os']['name'] ? {
    'Darwin'          => brew,
    /(Debian|Ubuntu)/ => undef,
    'windows'         => chocolatey,
    default           => fail("The ${name} class is not supported on ${facts['os']['name']}."),
  }

  package { 'yamllint':
    ensure   => $ensure,
    provider => $provider,
  }
}
