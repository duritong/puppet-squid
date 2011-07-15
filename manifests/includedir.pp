class squid::includedir {
  include ::squid
  file{'/etc/squid/include.d':
    ensure => directory,
    purge => true,
    recurse => true,
    force => true,
    require => Package['squid'],
    notify => Service['squid'],
    owner => root, group => squid, mode => 0640;
  }
}
