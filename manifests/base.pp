class squid::base {
  package { 'squid':
    ensure => present,
  }

  service{'squid':
    enable => true,
    ensure => running,
    hasstatus => true,
    require => Package[squid],
  }

  file {"squid_config":
    path => "/etc/squid/squid.conf",
    source => [ "puppet:///modules/site_squid/${::fqdn}/squid.conf",
                "puppet:///modules/site_squid/squid.conf",
                "puppet:///modules/squid/squid.conf" ],
    notify => Service[squid],
    owner => root, group => root, mode => 644;
  }
}
