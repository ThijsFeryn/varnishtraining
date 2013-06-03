include apt
include apt::update
apt::source { 'varnish':
  location        => 'http://repo.varnish-cache.org/ubuntu/',
  release     => 'lucid',
  repos => 'varnish-3.0',
  key => '60E7C096C4DEFFEB',
  key_source => 'http://repo.varnish-cache.org/debian/GPG-key.txt',
}
package { 'vim':
  ensure    => installed,
  require => Class['apt::update'],  
}
class { 'apache':
  require => Class['apt::update']
}
apache::vhost { 'varnish.dev':
    port => '8080',
    docroot     => '/home/data/',
    notify => File['ports.conf'],
}
class { 'php':
    require => Class['apt::update']
}
class { 'php::apache2':
    require => Class['apt::update']
}
file { 'ports.conf':
  ensure  => file,
  path    => "/etc/apache2/ports.conf",
  mode    => '0640',
  owner   => 'root',
  group   => 'root',
  content => template('project/ports.conf.erb'),
}
file { '000-default':
  ensure  => absent,
  path    => "/etc/apache2/sites-enabled/000-default",
  notify  => Service['apache'];
}
class varnish_custom inherits varnish {
    File["varnish.initconf"] {
        notify  => File["varnish.conf"],
        content => template("project/varnish.erb"),
    }
    File["varnish.conf"] {
        notify  => Service["varnish"],
        content => template("project/default.vcl.erb"),
    }
}
class { 'varnish_custom':
}
include nginx
file { 'nginx_vhost':
    ensure => file,
    path    => "/etc/nginx/sites-enabled/default",
    mode    => '0640',
    owner   => 'root',
    group   => 'root',
    content => template("project/nginx.site.erb"),
}