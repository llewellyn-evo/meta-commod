require recipes-images/images/phytec-headless-image.bb

SUMMARY =  "This image is designed for communication module "

IMAGE_FEATURES += "ssh-server-openssh hwcodecs"

LICENSE = "MIT"

inherit distro_features_check


IMAGE_INSTALL += "\
    packagegroup-base 		\
     bridge-utils 			\
     pps-tools 				\
     ptpd 					\
     net-tools 				\
     dune 					\
     chrony					\ 
     gpsd 					\
     monit					\
     screen 				\
     opkg					\
     socat 					\
     erlang 				\
     erlang-sasl 			\
     erlang-stdlib 			\
     erlang-kernel 			\
     erlang-erts 			\
     erlang-crypto			\
     usbutils				\
     ethtool				\
     fuse-exfat 			\
     bash 					\
     e2fsprogs 				\
     exfat-utils			\
     iproute2				\
"

IMAGE_INSTALL_remove = "packagegroup-update"