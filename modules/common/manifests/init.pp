class common {

  group { 'puppet':
    ensure => 'present',
  }

  package {[
      'htop',
      'curl',
      'rsync',
      'wget',
      'git',
      'vim',
      'pv',
      'tree',
    ]:
    ensure => latest,
  }

  apt::source { 'percona':
    location   => 'http://repo.percona.com/apt',
    release    => 'squeeze',
    repos      => 'main',
    pin        => '1001',
    key        => 'CD2EFD2A',
    key_server => 'keys.gnupg.net',
  }

  cron { 'apt-update':
    command => '/usr/bin/apt-get update',
    user    => root,
    hour    => 3,
    minute  => 25,
  }

}
