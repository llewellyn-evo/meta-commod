DESCRIPTION = "hw tools package for evologics systems"
LICENSE = "MIT"

inherit packagegroup

RDEPENDS_${PN} = " 						\
	 bridge-utils 		               	\
	 usbutils                           \
	 pps-tools 		               		\
	 net-tools	   		                \
	 can-utils                          \
     i2c-tools                          \
     ethtool			                \
     iputils                            \
"
