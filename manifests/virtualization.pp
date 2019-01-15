# virtualization.pp
#
# virtualization group
# Software to manage hosted guest OSes..
#
#

class tkhsw::virtualization (
  $ensure             = $tkhsw::params::software_ensure,
  $virtualbox_version = $tkhsw::params::virtualbox_version,
  $virtualbox_url     = $tkhsw::params::virtualbox_url,
) inherits tkhsw::params {

  class { '::tkhsw::virtualization::virtualbox':
    ensure  => $ensure,
    version => $virtualbox_version,
    url     => $virtualbox_url,
  }

}
