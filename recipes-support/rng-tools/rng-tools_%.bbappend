SUMMARY = "Random number generator daemon"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "                     \
           file://rngd.service  \
"

SYSTEMD_SERVICE_${PN} = "rngd.service"
