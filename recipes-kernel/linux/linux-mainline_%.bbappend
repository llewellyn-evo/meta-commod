


FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append += " \
   file://defconfig \
   file://imx6ul.dtsi \
    file://imx6ul-comm-module.dtsi \
    file://imx6ull.dtsi; \
    file://imx6ull-phytec-phycore-som.dtsi \
    file://imx6ull-phytec-segin.dtsi \
    file://imx6ull-phytec-segin-ff-rdk-emmc.dts \
    file://imx6ull-pinfunc.h  \
    file://imx6ull-pinfunc-snvs.h \
    file://imx6ul-phytec-phycore-som.dtsi \
    file://imx6ul-phytec-segin.dtsi \
    file://imx6ul-pinfunc.h \
"


do_configure_prepend() {
    cp ${WORKDIR}/*.dtsi ${S}/arch/arm/boot/dts/
    cp ${WORKDIR}/*.dts ${S}/arch/arm/boot/dts/
    cp ${WORKDIR}/defconfig ${WORKDIR}/imx_v6_v7_defconfig
}


COMPATIBLE_MACHINE  = "^("
COMPATIBLE_MACHINE .=  "phyboard-segin-imx6ul-2"
COMPATIBLE_MACHINE .= "|phyboard-segin-imx6ul-3"
COMPATIBLE_MACHINE .= "|phyboard-segin-imx6ul-4"
COMPATIBLE_MACHINE .= "|phyboard-segin-imx6ul-5"
COMPATIBLE_MACHINE .= "|phyboard-segin-imx6ul-6"
COMPATIBLE_MACHINE .= "|phyboard-segin-imx6ul-7"
COMPATIBLE_MACHINE .= "|mx6ul-comm-module"
COMPATIBLE_MACHINE .= ")$"
