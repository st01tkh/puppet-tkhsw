# editors.pp
#
# editors group
# Mainly text editors
#
#

class tkhsw::editors (
  $ensure = $tkhsw::params::software_ensure,
) inherits tkhsw::params {

  class { '::tkhsw::editors::atom':
    ensure => $ensure,
  }

  class { '::tkhsw::editors::sublime_text':
    ensure => $ensure,
  }

  class { '::tkhsw::editors::textmate':
    ensure => $ensure,
  }

  class { '::tkhsw::editors::neovim':
    ensure => $ensure,
  }

  class { '::tkhsw::editors::macvim':
    ensure => $ensure,
  }

  class { '::tkhsw::editors::vim':
    ensure => $ensure,
  }

  class { '::tkhsw::editors::vscode':
    ensure => $ensure,
  }

}
