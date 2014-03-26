class kdump::params {

  $config_template       = 'kdump/kdump_tools.erb'
  $core_dir              = '/var/crash'
  $debug_path            = ''
  $fail_cmd              = ''
  $install_kdump         = false
  $kernel_debug          = ''
  $makedump_args         = '-c -d 31'
  $net_proto             = 'none'
  $package_ensure        = 'present'
  $run_level             = ''
  $save_dir              = 'file:///var/crash'
  $sysctl_args           = ''
  $use_kdump             = true

  case $::osfamily {
    'Debian': {
      $config_file       = '/etc/default/kdump-tools'
      $packages_name      = [ 'kdump-tools', 'crash', 'makedumpfile' ]
    }
    default: {
      fail("The ${module_name} module is not supported on an ${operatingsystem} distribution.")
    }
  }

}
