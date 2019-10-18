# requires rgb-nvidia module
class profile::config::nvidia_driver_435 {

  include apt

  apt::ppa { 'ppa:graphics-drivers/ppa':
    ensure => present,
  }

  package {'nvidia-driver-435':
    ensure  => latest,
    require => [ Class['apt::update'], Apt::Ppa['ppa:graphics-drivers/ppa'] ],
    notify  => Reboot['after_nvidia'],
  }

  # https://forge.puppet.com/puppetlabs/reboot
  reboot { 'after_nvidia':
    apply  => finished,
  }

}