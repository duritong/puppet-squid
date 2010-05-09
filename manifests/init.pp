# modules/squid/manifests/init.pp - manage squid stuff
# Copyright (C) 2007 admin@immerda.ch
#

class squid { 
    case $operatingsystem {
        gentoo: { include squid::gentoo }
        centos: { include squid::centos }
        default: { include squid::base }
    }

    if $use_munin {
        include squid::munin
    }
}
