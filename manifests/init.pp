# modules/squid/manifests/init.pp - manage squid stuff
# Copyright (C) 2007 admin@immerda.ch
#

# modules_dir { "squid": }

class squid {
    package { 'squid':
        ensure => present,
        category => $operatingsystem ? {
            gentoo => 'net-proxy',
            default => '',
        }
    }

    service{'squid':
        enable => true,
        ensure => running,
        require => Package[squid],
    }

}

define squid::squid_config () {
    file {
        "/etc/squid/squid.conf":
        ensure => file, owner => root, group => root, mode => 644,
        source => [ "puppet://$server/files/squid/${fqdn}/squid.config",
                    "puppet://$server/files/squid/squid.config",
                    "puppet://$server/squid/squid.config" ],
        notify => Service[squid],
    }
}


