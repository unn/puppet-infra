node default {
  include apt
  include common
}

node /^web\d+$/ inherits default {

  class { 'mysql':
    package_name => 'percona-xtradb-cluster-client-5.5',
  }

  include nginx

  apt::source { 'nginx':
    location   => 'http://nginx.org/packages/debian/',
    release    => 'squeeze',
    repos      => 'nginx',
    key        => 'ABF5BD827BD9BF62',
    key_source => 'http://nginx.org/keys/nginx_signing.key',
    require    => Package['wget'],
  }

  nginx::resource::vhost { 'davidstoline.com':
    ensure   => present,
    www_root => '/var/www/drupal',
  }
  nginx::resource::vhost { 'rag.nu':
    ensure   => present,
    www_root => '/var/www/rag_nu',
  }
  nginx::resource::vhost { 'whatsmylatlng.com':
    ensure   => present,
    www_root => '/var/www/whatsmylatlng_com',
  }

  Class['common'] -> Class['mysql']
  
}

node /^db\d+$/ inherits default {

  Apt::Source['percona'] -> Class['mysql::server']

  class {'mysql::server':
    package_name => 'percona-xtradb-cluster-server-5.5',
    config_hash  => {
      'root_password' => 'root',
      'bind_address'  => $ipaddress,
    }
  }

#  apt::source { 'mongodb':
#    location    => 'http://downloads-distro.mongodb.org/repo/debian-sysvinit',
#    release     => 'dist',
#    repos       => '10gen',
#    key         => '7F0CEB10',
#    key_server  => 'keyserver.ubuntu.com',
#    include_src => 'false',
#    notify      => Exec['apt_update'],
#  }

  package{[
      'percona-toolkit',
      'mytop',
#      'mongodb-10gen',
    ]:
    ensure  => present,
    require => [
#      Apt::Source['mongodb'],
      Apt::Source['percona'],
    ]
  }
}