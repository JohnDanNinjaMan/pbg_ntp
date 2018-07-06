# Class installs ntp and makes sure it's running. Self contained in
# a class so that it's super simple to run.

class pbg_ntp {
  # Install the ntp package 
  ensure_packages(['ntp']

  # Ensures config is correct before service can run
  file { '/etc/ntp.conf':
    source  => 'puppet://modules/pbg_ntp/ntp.conf',
    notify  => Service['ntp'],
    require => Package['ntp'],
  }

  # Service only runs if file is present.
  service { 'ntp':
    ensure => running,
    enable => true,
  }
}

