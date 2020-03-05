FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "						   \
	file://gpsd.default                                \ 
	file://0001-added-configs-for-commodule-gpsd.patch \ 
	file://gpsd.service                                \
"      

SYSTEMD_SERVICE_${PN} += "${BPN}.service"