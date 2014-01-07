class dokuwiki (

  $repo_scheme   = $dokuwiki::params::repo_scheme,
  $repo_domain   = $dokuwiki::params::repo_domain,
  $repo_port     = $dokuwiki::params::repo_port,
  $repo_user     = $dokuwiki::params::repo_user,
  $repo_pass     = $dokuwiki::params::repo_pass,
  $repo_path     = $dokuwiki::params::repo_path,
  $repo_resource = $dokuwiki::params::package,
  $ldap           = false

) inherits dokuwiki::params {

  anchor {'dokuwiki::begin':
    before => Class['dokuwiki::install']
  }
  class {'dokuwiki::install':
    require => Anchor['dokuwiki::begin']
  }
  class {'dokuwiki::config':
    require => Class['dokuwiki::install']
  }
  anchor {'dokuwiki::end':
    require => Class['dokuwiki::config']
  }
}
