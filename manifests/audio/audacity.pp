#
# Audacity
#

class tkhsw::audio::audacity(
  $ensure = $tkhsw::params::software_ensure,
) inherits tkhsw::params {

  case $facts['os']['name'] {
    'Darwin': {
      osx_installer { "audacity-macos-2.1.3.dmg":
        mode => "copy",
        ensure   => $ensure,
        source => "/Users/Shared/data/Software/Audio/Audacity",
      }
    }
    'windows': {
      package { 'audacity':
        ensure   => $ensure,
        provider => chocolatey,
      }
    }
    default: {
      fail("The ${name} class is not supported on ${facts['os']['name']}.")
    }
  }

}
