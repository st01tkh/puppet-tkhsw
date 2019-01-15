# firefox.pp
# Install Firefox for OS X, Ubuntu, or Windows
# http://www.mozilla.org/en-US/firefox/new
#

class tkhsw::browsers::tor_browser(
  $ensure = $tkhsw::params::software_ensure,
) inherits tkhsw::params {

  $provider = $facts['os']['name'] ? {
    'Darwin'          => brewcask,
    /(Debian|Ubuntu)/ => undef,
    'windows'         => chocolatey,
    default           => fail("The ${name} class is not supported on ${facts['os']['name']}."),
  }

  package { 'tor-browser':
    ensure   => $ensure,
    provider => $provider,
  }
}
