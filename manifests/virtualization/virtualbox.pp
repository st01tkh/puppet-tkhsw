# virtualbox.pp
# Install Virtual Box for OS X, Ubuntu, or Windows
# https://www.virtualbox.org
#
#

class tkhsw::virtualization::virtualbox (
  $ensure  = $tkhsw::params::software_ensure,
  $version = $tkhsw::params::virtualbox_version,
  $url     = $tkhsw::params::virtualbox_url,
  $key     = $tkhsw::params::virtualbox_key,
) inherits tkhsw::params {

  case $facts['os']['name'] {
    'Darwin': {
      package { 'virtualbox':
        ensure   => $ensure,
        provider => brewcask,
      }
      -> package { 'virtualbox-extension-pack':
        ensure   => $ensure,
        provider => brewcask,
      }
    }
    'Debian', 'Ubuntu': {
      assert_type(String[1], $version)
      assert_type(Stdlib::HTTPUrl, $url)
      assert_type(Hash, $key)

      $apt_source_ensure = $ensure ? {
        'installed' => present,
        'latest'    => present,
        default     => $ensure,
      }

      include '::apt'
      apt::source { 'virtualbox':
        ensure   => $apt_source_ensure,
        location => $url,
        repos    => 'contrib',
        key      => $key,
      }
      -> Class['apt::update']

      -> package { 'dkms': }
      -> package { "virtualbox-${version}":
        ensure => $ensure,
      }
    }
    'windows': {
      package { 'virtualbox':
        ensure          => $ensure,
        provider        => chocolatey,
        install_options => ['--allow-empty-checksums'],
      }
    }
    default: {
      fail("The ${name} class is not supported on ${facts['os']['name']}.")
    }
  }

}
