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
        ensure => file, owner => root, group => root, mode => 644,
        source => [ "puppet://$server/modules/site-squid/${fqdn}/squid.conf",
                    "puppet://$server/modules/site-squid/squid.conf",
                    "puppet://$server/modules/squid/squid.conf" ],
        notify => Service[squid],
    }
}
