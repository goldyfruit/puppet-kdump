class kdump (
  $config_template       = $kdump::params::config_template,
  $core_dir              = $kdump::params::core_dir,
  $debug_path            = $kdump::params::debug_path,
  $fail_cmd              = $kdump::params::fail_cmd,
  $install_kdump         = $kdump::params::install_kdump,
  $kernel_debug          = $kdump::params::kernel_debug,
  $makedump_args         = $kdump::params::makedump_args,
  $net_proto             = $kdump::params::net_proto,
  $package_ensure        = $kdump::params::package_ensure,
  $packages_name         = $kdump::params::packages_name,
  $run_level             = $kdump::params::run_level,
  $save_dir              = $kdump::params::save_dir,
  $sysctl_args           = $kdump::params::sysctl_args,
  $use_kdump             = $kdump::params::use_kdump,
) inherits kdump::params {

  include stdlib

  validate_string($config_template)
  validate_string($core_dir)
  validate_string($debug_path)
  validate_string($fail_cmd)
  validate_bool($install_kdump)
  validate_string($kernel_debug)
  validate_string($makedump_args)
  validate_string($net_proto)
  validate_string($package_ensure)
  validate_array($packages_name)
  validate_string($run_level)
  validate_string($save_dir)
  validate_string($sysctl_args)
  validate_bool($use_kdump)

  anchor { 'kdump::begin': } ->
  class { '::kdump::install': } ->
  class { '::kdump::config': } ~>
  anchor { 'kdump::end': }

}

