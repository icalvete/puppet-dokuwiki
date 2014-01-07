class dokuwiki::install {

  common::down_resource {'dokuwiki_get_package':
    scheme   => $dokuwiki::repo_scheme,
    domain   => $dokuwiki::repo_domain,
    port     => $dokuwiki::repo_port,
    user     => $dokuwiki::repo_user,
    pass     => $dokuwiki::repo_pass,
    path     => $dokuwiki::repo_path,
    resource => $dokuwiki::repo_resource,
  }

  exec {'dokuwiki_install_package':
    cwd     => $dokuwiki::params::install_dir,
    command => "/bin/tar xvfz /tmp/${dokuwiki::repo_resource}",
    require => Common::Down_resource['dokuwiki_get_package'],
  }

  exec {'dokuwiki_document_root':
    cwd     => $dokuwiki::params::install_dir,
    command => '/bin/ln -s dokuwiki-* dokuwiki',
    unless  => '/usr/bin/test -h dokuwiki',
    require => Exec['dokuwiki_install_package']
  }

  exec {'dokuwiki_set_perms':
    cwd     => $dokuwiki::params::install_dir,
    command => "/bin/chown root.root ${dokuwiki::params::install_dir}/dokuwiki* -R",
    require => Exec['dokuwiki_document_root']
  }

  exec {'dokuwiki_set_conf_perms':
    cwd     => "${dokuwiki::params::install_dir}/dokuwiki",
    command => "/bin/chmod 777 ${dokuwiki::params::install_dir}/dokuwiki/conf -R",
    require => Exec['dokuwiki_set_perms']
  }

  exec {'dokuwiki_set_data_perms':
    cwd     => "${dokuwiki::params::install_dir}/dokuwiki",
    command => "/bin/chmod 777 ${dokuwiki::params::install_dir}/dokuwiki/data -R",
    require => Exec['dokuwiki_set_perms']
  }
}

