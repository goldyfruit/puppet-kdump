class kdump::config inherits kdump {

  file { $kdump::config_file:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template($kdump::config_template),
  }

}
