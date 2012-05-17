node default {
  include common
}

node /^web\d+$/ inherits default {
  include nginx
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
}

node /^db\d+$/ inherits default {


}