# manifests/munin.pp

class squid::munin {
    $real_squid_munin_ip = $squid_munin_ip ? {
        '' => $ipaddress,
        default => $squid_munin_ip
    }
    $real_squid_munin_port = $squid_munin_port ? {
        '' => 3128,
        default => $squid_munin_port
    }

    munin::plugin{ 'squid_cache': config => "user root\nenv.squidhost ${ipaddress}\nenv.squidport ${real_squid_munin_port}"}
    munin::plugin{ 'squid_icp': config => "user root\nenv.squidhost ${ipaddress}\nenv.squidport ${real_squid_munin_port}"}
    munin::plugin{ 'squid_requests': config => "user root\nenv.squidhost ${ipaddress}\nenv.squidport ${real_squid_munin_port}"}
    munin::plugin{ 'squid_traffic': config => "user root\nenv.squidhost ${ipaddress}\nenv.squidport ${real_squid_munin_port}"}
}
