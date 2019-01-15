# storage.pp
#
# storage group
# File Storage apps..
# FTP/SFTP and Cloud Storage
#
#

class tkhsw::storage (
  $ensure = $tkhsw::params::software_ensure,
) inherits tkhsw::params {

  class { '::tkhsw::storage::fetch':
    ensure => $ensure,
  }

  class { '::tkhsw::storage::filezilla':
    ensure => $ensure,
  }

}
