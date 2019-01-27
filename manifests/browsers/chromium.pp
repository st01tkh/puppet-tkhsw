#

class tkhsw::browsers::chromium (
  $ensure  = $tkhsw::params::software_ensure,
  $url     = $tkhsw::params::chrome_url,
  $channel = $tkhsw::params::chrome_channel,
) inherits tkhsw::params {

  case $facts['os']['name'] {
    'Darwin': {
      package { 'chromium':
        ensure   => $ensure,
        provider => brewcask,
      }
    }
    'Debian', 'Ubuntu': {
      package { "chromium":
        ensure => $ensure,
      }
    }
    'windows': {
      package { 'chromium':
        ensure   => $ensure,
        provider => chocolatey,
      }
    }
    default: {
      fail("The ${name} class is not supported on ${facts['os']['name']}.")
    }
  }

}
