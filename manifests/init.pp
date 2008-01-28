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

}

