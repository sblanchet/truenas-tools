# Utilities for TrueNAS Core

Collection of scripts for TrueNAS Core from different authors.

## Installation

To install all the scripts in `/usr/local/bin`, run the following command
```
make install
```

## List of scripts

- `cpu-temperature.sh` : print CPU temperatures
- `disk-blink.sh` : blink disk in enclosure (require SAS3008 HBA and SuperMicro SAS3 expander)
- `disklist.pl` : list hard disks (dependency for `disk-blink.sh` and `disk-unblink.sh`)
- `disk-temperature.sh` : print disks temperatures
- `disk-unblink.sh` : unblink disk in enclosure (require SAS3008 HBA and SuperMicro SAS3 expander)
- `set_atime_off.sh` : set atime=off on all ZFS pools
- `snaplist.sh` : list recursively ZFS snapshots
- `vm-console.sh` : connect to the serial console of a virtual machine
- `vm-list.sh` : list virtual machines
- `vm-shutdown.sh` : shutdown a virtual machine immediately without waiting for guest OS.
- `vm-start.sh` : start a virtual machine
- `vm-stop.sh` : gracefully stop a virtual machine, ask the guest OS to shutdown the VM.
