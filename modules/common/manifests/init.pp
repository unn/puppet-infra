class common {
  group { 'puppet':
    ensure => 'present',
  }

  apt::source { 'percona':
    location          => 'http://repo.percona.com/apt',
    release           => 'squeeze',
    repos             => 'main',
@    required_packages => 'libmysqlclient18=5.5.23-rel25.3-240.squeeze',
    key               => 'CD2EFD2A',
    key_server        => 'keys.gnupg.net',
    include_src       => '1C4CBDCDCD2EFD2A',
  }

  apt::source { 'dotdeb':
    location          => 'http://packages.dotdeb.org',
    release           => 'squeeze',
    repos             => 'all',
    key               => 'E9C74FEEA2098A6E',
    key_source        => 'http://www.dotdeb.org/dotdeb.gpg',
    require           => [
      Package['wget'],
      Apt::Source['percona'],
    ],
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

  package {[
      'percona-xtradb-cluster-client-5.5',
      'libmysqlclient18=5.5.23-rel25.3-240.squeeze',
    ]:
    require => Apt::Source['percona'],
  }

  cron {
    'apt-update':
      command => '/usr/bin/apt-get update',
      user    => root,
      hour    => 3,
      minute  => 25,
  }

}
