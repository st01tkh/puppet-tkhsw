# vim.pp
# Install VI Improved
#

class tkhsw::editors::vim (
  $ensure = $tkhsw::params::software_ensure,
) inherits tkhsw::params {

  $provider = $facts['os']['name'] ? {
    /(Debian|Ubuntu)/ => undef,
    'windows'         => chocolatey,
    default           => fail("The ${name} class is not supported on ${facts['os']['name']}."),
  }

  package { 'vim':
    ensure   => $ensure,
    provider => $provider,
  }
}
