# browsers.pp
#
# browsers group
# Mainly web browsers and plugins
#
#

class tkhsw::browsers (
  $ensure         = $tkhsw::params::software_ensure,
  $chrome_url     = $tkhsw::params::chrome_url,
  $chrome_channel = $tkhsw::params::chrome_channel,
) inherits tkhsw::params {

  class { '::tkhsw::browsers::chrome':
    ensure  => $ensure,
    url     => $chrome_url,
    channel => $chrome_channel,
  }

  class { '::tkhsw::browsers::firefox':
    ensure => $ensure,
  }

}
