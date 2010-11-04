# manifests/munin.pp

class squid::munin {
    munin::plugin{ 'squid_cache': }
    munin::plugin{ 'squid_icp': }
    munin::plugin::deploy{'squid':
        source => "squid/munin/squid",
    }
}
