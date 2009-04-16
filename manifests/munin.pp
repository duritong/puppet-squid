# manifests/munin.pp

class squid::munin {
    munin::plugin{ 'squid_cache': }
    munin::plugin{ 'squid_icp': }
    munin::plugin{ 'squid_requests': }
    munin::plugin{ 'squid_traffic': }
    include nc
    munin::plugin::deploy{'squid_efficiency':
        source => "squid/munin/squid_efficiency",
        require => Package['nc'],
    }
}
