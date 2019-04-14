# vscode.pp
# Install Visual Studio Code
#

class tkhsw::editors::vscode(
  $ensure = $tkhsw::params::software_ensure,
) inherits tkhsw::params {

  $provider = $facts['os']['name'] ? {
    /(Debian|Ubuntu)/ => undef,
    'Darwin'          => brewcask,
    'windows'         => chocolatey,
    default           => fail("The ${name} class is not supported on ${facts['os']['name']}."),
  }

  $package_name = $facts['os']['name'] ? {
    /(Debian|Ubuntu)/ => 'vscode',
    'Darwin'          => 'visual-studio-code',
    'windows'         => 'vscode',
    default           => fail("The ${name} class is not supported on ${facts['os']['name']}."),
  }

  package { $package_name:
    ensure   => $ensure,
    provider => $provider,
  }

  $vscode_ext_ensure = $ensure ? {
    'installed' => latest,
    default     => $ensure,
  }

  create_resources('package', merge($packages, $themes), {
      ensure   => $vscode_ext_ensure,
      provider => 'scode_extension', 
      require  => Package[$package_name],
  })
}
