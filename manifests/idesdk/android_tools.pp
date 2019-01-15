# android_tools.pp
# Install Android Tools
# adb and fastboot command line tools
#

class tkhsw::idesdk::android_tools (
  $ensure = $tkhsw::params::software_ensure,
) inherits tkhsw::params {

  case $facts['os']['name'] {
    'Ubuntu': {
      package { ['android-tools-adb', 'android-tools-fastboot']:
        ensure => $ensure,
      }
    }
    'windows': {
      package { 'adb':
        ensure   => $ensure,
        provider => chocolatey,
      }
    }
    default: {
      fail("The ${name} class is not supported on ${facts['os']['name']}.")
    }
  }

}
