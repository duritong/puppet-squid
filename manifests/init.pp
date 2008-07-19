# modules/squid/manifests/init.pp - manage squid stuff
# Copyright (C) 2007 admin@immerda.ch
#

# modules_dir { "squid": }

class squid { 
    case $operatingsystem {
        gentoo: { include squid::gentoo }
        default: { include squid::base }
    }

    if $use_munin {
        include squid::munin
    }
}


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
        source => [ "puppet://$server/files/squid/${fqdn}/squid.conf",
                    "puppet://$server/files/squid/squid.conf",
                    "puppet://$server/squid/squid.conf" ],
        notify => Service[squid],
    }
}

class squid::gentoo inherits squid::base {
    Package[squid]{
        category => 'net-proxy',
    }
}
