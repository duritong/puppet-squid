# rpms: we got the latest rpm from here:
# http://people.redhat.com/mnagy/squid/
# distro rpms seems to have problems...
class squid::centos inherits squid::base {
    file{'/etc/sysconfig/squid':
        source => [ "puppet://$server/modules/site-squid/sysconfig/${fqdn}/squid",
                    "puppet://$server/modules/site-squid/sysconfig/squid",
                    "puppet://$server/modules/squid/sysconfig/squid" ],
        require => Package['squid'],
        notify => Service['squid'],
        owner => root, group => 0, mode => '0644';
    }
}