class common {
  group { "puppet":
    ensure => "present",
  }

  package {[
      "htop",
      "curl",
      "wget",
      "rsync",
      "git",
      "vim",
      "pv",
      "tree",
    ]:
    ensure => latest;
  }
  
#  apt::source { "percona":
#    location          => "http://repo.percona.com/apt",
#    release           => "squeeze",
#    repos             => "main",
#    key               => "55BE302B",
#    key_server        => "keys.gnupg.net",
#    include_src       => CD2EFD2A
#  }
  
#  apt::source { "dotdeb":
#    location          => "http://packages.dotdeb.org",
#    release           => "squeeze",
#    repos             => "all",
#  }
  
  cron {
    "apt-update":
      command => "/usr/bin/apt-get update",
        user    => root,
        hour    => 3,
        minute  => 25;
  }

}