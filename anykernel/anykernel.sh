# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=rainbow
do.devicecheck=0
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=lime
device.name2=citrus
device.name3=juice
device.name4=
device.name5=
supported.versions=
supported.patchlevels=
'; } # end properties

# shell variables
block=/dev/block/by-name/boot;
dtbblock=/dev/block/by-name/dtb;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;


## AnyKernel boot install
dump_boot;
write_boot;
## end boot install

#Method 2:
#split_boot;
#ui_print "- Installing Rainbow kernel";
#flash_boot;

#ui_print " ";
#ui_print "- Installing/updating Rainbow dtb";
#ui_print " ";
#flash_dtb;

# shell variables
#block=vendor_boot;
#is_slot_device=1;
#ramdisk_compression=auto;

# reset for vendor_boot patching
#reset_ak;


## AnyKernel vendor_boot install
#split_boot; # skip unpack/repack ramdisk since we don't need vendor_ramdisk access

#flash_boot;
## end vendor_boot install

