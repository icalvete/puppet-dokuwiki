class dokuwiki::params {

  $org_domain  = hiera('org_domain')

  $repo_scheme = hiera('sp_repo_scheme')
  $repo_domain = hiera('sp_repo_domain')
  $repo_port   = hiera('sp_repo_port')
  $repo_user   = hiera('sp_repo_user')
  $repo_pass   = hiera('sp_repo_pass')
  $repo_path   = hiera('sp_repo_path')
  $package     = hiera('dokuwiki_package')

  $install_dir = '/srv'

  $admin_pass = hiera('dokuwiki_admin_pass')
}

