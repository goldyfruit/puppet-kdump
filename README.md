puppet-kdump
============

This module manages Kdump (kernel crash dump)
The puppet-grub2 module is required

## Parameters

#### config_template
- Template used for Kdump config file
- **STRING** : *'kdump/kdump_tools.erb'*

#### core_dir
 - Local path to save the vmcore to
 - **STRING** : *'/var/crash'*

#### debug_path
- Path to a debug version of the running kernel
- **STRING** : *Empty by default*

#### fail_cmd
- This variable can be used to cause a reboot or start a shell if saving the VMcore fails
- **STRING** : *Empty by default*

#### install_kdump
- Install the Kdump packages
- **BOOL** : *false*

#### kernel_debug
- Define the kernel debug package to install
- **STRING** : *Empty by default*

#### makedump_args
- Extra arguments passed to makedumpfile to determine what Kdump should put in a VMcore
- **STRING** : *-c -d 31*

#### net_proto
- Define if Kdump should send the VMcore via SSH, FTP, NFS, etc...
- **STRING** : *none*

#### package_ensure
- Puppet stuff, define in which state should be the Kdump packages
- **STRING** : *'present'*

#### run_level
- Define in which run level Kdump should reboot the system
- **STRING** : *Empty by default*

#### save_dir
- Only used if net_proto is set, define where the VMcore should be create
- **STRING** : *file:///var/crash*

#### sysctl_args
- Controls when a panic occurs, using the sysctl interface.
- **STRING** : *Empty by default*

#### use_kdump
- Define how many time (in second) that the menu should appears
- **BOOL** : *true*

### Example

    class { 'grub2':
      update_grub               => false,
      install_grub              => false,
      cmdline_linux_default     => 'quiet crashkernel=256M nmi_watchdog=0 console=tty0 console=ttyS1,115200n8',
      terminal                  => 'serial console',
      default_entry             => 0,
      timeout                   => 5,
      serial_command            => 'serial --speed=115200 --unit=1 --word=8 --parity=no --stop=1',
      disable_uuid              => true,
      disable_recovery          => true,
      tune                      => '480 440 1',
      device_install            => '/dev/sda',
    }

    class { 'kdump':
        install_kdump             => true,
        use_kdump                 => true,
        core_dir                  => '/var/crash',
        debug_path                => '/usr/lib/debug/boot/vmlinux-3.2.0-4-amd64',
        kernel_debug              => 'linux-image-3.2.0-4-amd64-dbg',
        fail_cmd                  => 'reboot -f',
        makedump_args             => '-c -d 31',
        net_proto                 => 'none',
        run_level                 => '1',
        save_dir                  => 'file:///var/crash',
        sysctl_args               => 'kernel.panic_on_oops=1 vm.panic_on_oom=1',
    }

