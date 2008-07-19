# manifests/munin.pp

class squid::munin {
    munin::plugin{ 'squid_cache': config => "user root\nenv.squidhost localhost\nenv.squidport 80"}
    munin::plugin{ 'squid_icp': }
    munin::plugin{ 'squid_requests': }
    munin::plugin{ 'squid_traffic': }
}
