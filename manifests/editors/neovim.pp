# 
# Install Neo VI Improved
#

class tkhsw::editors::neovim (
  $ensure = $tkhsw::params::software_ensure,
) inherits tkhsw::params {

  $provider = $facts['os']['name'] ? {
    /(Debian|Ubuntu)/ => undef,
    'Darwin'          => brew,
    'windows'         => chocolatey,
    default           => fail("The ${name} class is not supported on ${facts['os']['name']}."),
  }

  package { 'neovim':
    ensure   => $ensure,
    provider => $provider,
  }
}
