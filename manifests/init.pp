# modules/squid/manifests/init.pp - manage squid stuff
# Copyright (C) 2007 admin@immerda.ch
#

class squid (
  $manage_munin = false
) {
  case $::operatingsystem {
    gentoo: { include squid::gentoo }
    centos: { include squid::centos }
    default: { include squid::base }
  }

  if $squid::manage_munin {
    include squid::munin
  }
}
