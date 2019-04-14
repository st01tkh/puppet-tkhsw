#
# MacVim
#

class tkhsw::editors::macvim (
  $ensure = $tkhsw::params::software_ensure,
) inherits tkhsw::params {

  $provider = $facts['os']['name'] ? {
    /(Debian|Ubuntu)/ => undef,
    'Darwin'          => brew,
    default           => fail("The ${name} class is not supported on ${facts['os']['name']}."),
  }

  package { 'macvim':
    ensure   => $ensure,
    provider => $provider,
  }
}
