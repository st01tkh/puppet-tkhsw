# vlc.pp
# Install VideoLAN Media Player
# http://www.videolan.org/vlc/index.html
#

class tkhsw::entertainment::vlc (
  $ensure = $tkhsw::params::software_ensure,
) inherits tkhsw::params {

  $provider = $facts['os']['name'] ? {
    'Darwin'          => brewcask,
    /(Debian|Ubuntu)/ => undef,
    'windows'         => chocolatey,
    default           => fail("The ${name} class is not supported on ${facts['os']['name']}."),
  }

  package { 'vlc':
    ensure   => $ensure,
    provider => $provider,
  }
}
