class kdump::install inherits kdump {

  if $kdump::install_kdump {
    package { $kdump::packages_name:
      ensure => $kdump::package_ensure,
    }
    package { $kdump::kernel_debug:
      ensure => $kdump::package_ensure,
    }
  }

}
