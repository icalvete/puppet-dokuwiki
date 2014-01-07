class dokuwiki::config {

  $admin_pass =  $dokuwiki::params::admin_pass

  file{ 'dokuwiki_vhost':
    ensure  => present,
    path    => "${apache2::params::ensites}/dokuwiki.vhost.conf",
    content => template("${module_name}/dokuwiki.vhost.conf.erb"),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  file{ 'dokuwiki_plugins.local.php':
    ensure  => present,
    path    => "${dokuwiki::params::install_dir}/dokuwiki/conf/plugins.local.php",
    content => template("${module_name}/plugins.local.php.erb"),
    owner   => 'root',
    group   => 'root',
    mode    => '0666',
  }

  file{ 'dokuwiki_acl.auth.php':
    ensure  => present,
    path    => "${dokuwiki::params::install_dir}/dokuwiki/conf/acl.auth.php",
    content => template("${module_name}/acl.auth.php.erb"),
    owner   => 'root',
    group   => 'root',
    mode    => '0666',
  }

  file{ 'dokuwiki_local.php':
    ensure  => present,
    path    => "${dokuwiki::params::install_dir}/dokuwiki/conf/local.php",
    content => template("${module_name}/local.php.erb"),
    owner   => 'root',
    group   => 'root',
    mode    => '0666',
  }

  file{ 'dokuwiki_users.auth.php':
    ensure  => present,
    path    => "${dokuwiki::params::install_dir}/dokuwiki/conf/users.auth.php",
    content => template("${module_name}/users.auth.php.erb"),
    owner   => 'root',
    group   => 'root',
    mode    => '0666',
  }
}

