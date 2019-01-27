#

class tkhsw::browsers::opera(
  $ensure  = $tkhsw::params::software_ensure,
  $url     = $tkhsw::params::opera_url,
  $channel = $tkhsw::params::opera_channel,
) inherits tkhsw::params {

  case $facts['os']['name'] {
    'Darwin': {
      package { 'opera':
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
      apt::source { 'opera':
        ensure       => $apt_source_ensure,
        location     => $url,
        release      => 'stable',
        repos        => 'non-free',
        key          => {
          #'id'     => '4CCA1EAF950CEE4AB83976DCA040830F7FAC5991',
          'source' => 'https://deb.opera.com/archive.key',
        },
        architecture => 'amd64',
      }
      -> Class['apt::update']

      -> package { "opera-${channel}":
        ensure => $ensure,
      }
    }
    'windows': {
      package { 'opera':
        ensure   => $ensure,
        provider => chocolatey,
      }
    }
    default: {
      fail("The ${name} class is not supported on ${facts['os']['name']}.")
    }
  }

}
