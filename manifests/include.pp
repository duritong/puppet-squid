define squid::include($content = undef){
  include ::squid
  require squid::includedir

  file{"/etc/squid/include.d/${name}":
    notify => Service['squid'],
    owner => root, group => squid, mode => 0640;
  }

  if !$content {
    File["/etc/squid/include.d/${name}"]{
      source => [ "puppet:///modules/site-squid/include.d/${fqdn}/${name}",
                  "puppet:///modules/site-squid/include.d/${name}" ]
    }
  } else {
    File["/etc/squid/include.d/${name}"]{
      content => $content,
    }
  }
}
