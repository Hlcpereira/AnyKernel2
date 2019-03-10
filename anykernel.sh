# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=0
supported.versions=9, 9.0
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;

## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;

# Save the users from themselves
android_version="$(file_getprop /system/build.prop "ro.build.version.release")";
supported_version=9;
if [ "$android_version" != "$supported_version" ]; then
  ui_print " "; ui_print "You are on Android $android_version but this kernel is only for Android $supported_version!";
  exit 1;
fi;

## AnyKernel install

dump_boot;

write_boot;

## end install

