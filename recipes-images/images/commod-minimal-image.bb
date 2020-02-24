require recipes-images/images/phytec-headless-image.bb

SUMMARY =  "This image is designed for communication module "

IMAGE_FEATURES += "ssh-server-openssh hwcodecs"

LICENSE = "MIT"

inherit distro_features_check


IMAGE_INSTALL += "\
    packagegroup-base 		\
    packagegroup-3g			\
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
"