##############################################################
# File...: /README_REMOVED_PACKAGES.TXT
# Purpose: List which applications have been removed from the
#          standard Slackware source tree
# Author : Stuart Winter 
##############################################################

Not required for ARM:

A series
---------

Package.........................Reason it was removed

  syslinux			x86 only
  efibootmgr                    x86 only
  elilo 			x86 only
  grub                          x86 only
  lilo 				x86 only
  loadlin    			x86 only
  kernel-generic                Not applicable on ARM
  kernel-huge                   Not applicable on ARM
  kernel-modules                ARM has architecture-specific 'kernel-modules' packages
  mcelog                        x86 only
  
AP series
--------

Package.........................Reason it was removed

  libx86                        x86 only
  vbetool                       x86 only
  seejpeg                       x86 only

D series
--------

Package.........................Reason it was removed

  dev86                         x86 only
  clisp                         Does not compile on ARM
  gnu-efi                       x86 only


L series
---------

Package.........................Reason it was removed

  phonon-xine                   Abandoned upstream. Won't build on ARM.
  gnu-efi			Not applicable on ARM
  svgalib_helper                The svgalib package is a dummy for
                                ARM, so the helper package which contains
                                the Kernel modules is not required
  jre				x86 only (no source)


  For Java on ARM, your best bet is to install the OpenJDK package
  from the '/extra/ directory.

  seamonkey-solibs              The Mozilla suite do not build for ARMv5

X series
--------

Package.........................Reason it was removed
  
  xf86-input-vmmouse            Does not build on ARM
  intel-gpu-tools               Not applicable on ARM
  xf86-video-intel              Not applicable on ARM

XAP series
----------

Package.........................Reason it was removed


  mozilla-firefox
  mozilla-thunderbird           The Mozilla suite do not build on ARMv5
  seamonkey         
                                ARMv6j+ builds can be found for -current only at
                                ftp://ftp.arm.slackware.com/slackwarearm/unsupported/slackwarearm-current

