require recipes-images/images/phytec-headless-image.bb

SUMMARY =  "This image is designed for communication module "

IMAGE_FEATURES += "ssh-server-openssh hwcodecs"

LICENSE = "MIT"

inherit distro_features_check

EXTRA_IMAGE_FEATURES += "read-only-rootfs"


IMAGE_INSTALL += "                      \
     packagegroup-base 	               \
     packagegroup-3g                    \
     packagegroup-core-buildessential   \
     packagegroup-userland              \
     packagegroup-erlang                \
     packagegroup-hw-utils              \
     rng-tools                          \
     ptpd 			               \
     dune 			               \
     chrony			               \ 
     gpsd 			               \
     screen 			               \
     opkg			                    \
     tmux                               \
     netcat-openbsd                     \
     tcl                                \
     expect                             \
     tar                                \
     daemonize                          \
     ltrace                             \
     file                               \
     gzip                               \
     util-linux                         \
     fuse-exfat                         \
     bash                               \
     e2fsprogs                          \
     exfat-utils                        \
     grep                               \
     coreutils                          \
     procps                             \
     socat 			               \
     fuse-exfat 		               \
     bash 			               \
     e2fsprogs 		               \
     exfat-utils		               \
     iproute2			               \
     dhcp-client                        \
     vim                                \
     git                                \
     ckermit                            \
     python                             \
"

IMAGE_INSTALL_remove = "                \
     packagegroup-update                \
     ofono                              \
     ofono-tests                        \
"
