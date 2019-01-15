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
      assert_type(Stdlib::HTTPUrl, $url)
      assert_type(String[1], $channel)

      $apt_source_ensure = $ensure ? {
        'installed' => present,
        'latest'    => present,
        default     => $ensure,
      }

      include '::apt'
      apt::source { 'chromium':
        ensure       => $apt_source_ensure,
        location     => $url,
        release      => 'stable',
        repos        => 'main',
        key          => {
          'id'     => '4CCA1EAF950CEE4AB83976DCA040830F7FAC5991',
          'source' => 'https://dl.google.com/linux/linux_signing_key.pub',
        },
        architecture => 'amd64',
      }
      -> Class['apt::update']

      -> package { "chromium-${channel}":
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
