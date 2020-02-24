FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-enabled-fec2.patch"


python do_env_append_mx6ul-comm-module() {
    env_add(d, "config-expansions",
"""#!/bin/sh

. /env/expansions/imx6ul-phytec-segin-peb-eval-01
#use this expansion when a capacitive touchscreen is connected
#. /env/expansions/imx6ul-phytec-segin-peb-av-02
#use this expansion when a resisitive touchscreen is connected
#. /env/expansions/imx6ul-phytec-segin-peb-av-02-res

#use this expansion when peb-wlbt-01 adapter is connected
#. /env/expansions/imx6ul-phytec-peb-wlbt-01

# imx6ul-phytec-lcd: 7" display
#of_display_timings -S /soc/aips-bus@2100000/lcdif@21c8000/display@di0/display-timings/ETM0700G0EDH6

# imx6ul-phytec-lcd: 5.7" display
#of_display_timings -S /soc/aips-bus@2100000/lcdif@21c8000/display@di0/display-timings/ETMV570G2DHU

# imx6ul-phytec-lcd: 4.3" display
#of_display_timings -S /soc/aips-bus@2100000/lcdif@21c8000/display@di0/display-timings/ETM0430G0DH6

# imx6ul-phytec-lcd: 3.5" display
#of_display_timings -S /soc/aips-bus@2100000/lcdif@21c8000/display@di0/display-timings/ETM0350G0DH6

#use this bootarg if the VM010 Color is connected
#. /env/expansions/imx6ul-phytec-vm010-col

#use this bootarg if the VM010 Monochrome is connected
#. /env/expansions/imx6ul-phytec-vm010-bw

#use this bootarg if the VM011 Color is connected
#. /env/expansions/imx6ul-phytec-vm011-col

#use this bootarg if the VM011 Monochrome is connected
#. /env/expansions/imx6ul-phytec-vm011-bw

#use this bootarg if the VM009 is connected
#. /env/expansions/imx6ul-phytec-vm009
""")
    env_add(d, "expansions/imx6ul-phytec-segin-peb-eval-01",
"""
of_fixup_status /gpio-keys
of_fixup_status /user-leds
""")
    env_add(d, "expansions/imx6ul-phytec-segin-peb-av-02",
"""
of_fixup_status /soc/aips-bus@2100000/lcdif@21c8000/
of_fixup_status /soc/aips-bus@2100000/lcdif@21c8000/display@di0
of_fixup_status /backlight
of_fixup_status /soc/aips-bus@2100000/i2c@21a0000/edt-ft5x06@38
of_fixup_status /soc/aips-bus@2000000/pwm@2088000/
""")
    env_add(d, "expansions/imx6ul-phytec-segin-peb-av-02-res",
"""
of_fixup_status /soc/aips-bus@2100000/lcdif@21c8000/
of_fixup_status /soc/aips-bus@2100000/lcdif@21c8000/display@di0
of_fixup_status /backlight
of_fixup_status /soc/aips-bus@2100000/i2c@21a0000/stmpe@44
of_fixup_status /soc/aips-bus@2000000/pwm@2088000/
""")
    env_add(d, "expansions/imx6ul-phytec-peb-wlbt-01",
"""#!/bin/sh
of_fixup_status /soc/aips-bus@2100000/usdhc@2194000
of_fixup_status /regulator-wlan-en
of_fixup_status -d /soc/aips-bus@2100000/adc@2198000
""")
    env_add(d, "expansions/imx6ul-phytec-vm010-col",
"""#!/bin/sh
CAM_PATH="/soc/aips-bus@2100000/i2c@21a0000/cam0@48"
ENDPOINT_PATH="/soc/aips-bus@2100000/i2c@21a0000/cam0@48/port/endpoint"

of_property -f -s ${CAM_PATH} compatible "aptina,mt9v024"
of_property -f -d ${CAM_PATH} assigned-clocks
of_property -f -d ${CAM_PATH} assigned-clock-parents
of_property -f -d ${CAM_PATH} assigned-clock-rates

of_fixup_status ${CAM_PATH}
""")
    env_add(d, "expansions/imx6ul-phytec-vm010-bw",
"""#!/bin/sh
CAM_PATH="/soc/aips-bus@2100000/i2c@21a0000/cam0@48"
ENDPOINT_PATH="/soc/aips-bus@2100000/i2c@21a0000/cam0@48/port/endpoint"

of_property -f -s ${CAM_PATH} compatible "aptina,mt9v024m"
of_property -f -d ${CAM_PATH} assigned-clocks
of_property -f -d ${CAM_PATH} assigned-clock-parents
of_property -f -d ${CAM_PATH} assigned-clock-rates

of_fixup_status ${CAM_PATH}
""")
    env_add(d, "expansions/imx6ul-phytec-vm011-col",
"""#!/bin/sh
CAM_PATH="/soc/aips-bus@2100000/i2c@21a0000/cam0@48"
ENDPOINT_PATH="/soc/aips-bus@2100000/i2c@21a0000/cam0@48/port/endpoint"

of_property -f -s ${CAM_PATH} compatible "aptina,mt9p006"
of_property -f -d ${ENDPOINT_PATH} link-frequencies
of_property -f -s ${ENDPOINT_PATH} input-clock-frequency <50000000>
of_property -f -s ${ENDPOINT_PATH} pixel-clock-frequency <50000000>
of_property -f -s ${ENDPOINT_PATH} pclk-sample <0>

of_fixup_status ${CAM_PATH}
""")
    env_add(d, "expansions/imx6ul-phytec-vm011-bw",
"""#!/bin/sh
CAM_PATH="/soc/aips-bus@2100000/i2c@21a0000/cam0@48"
ENDPOINT_PATH="/soc/aips-bus@2100000/i2c@21a0000/cam0@48/port/endpoint"

of_property -f -s ${CAM_PATH} compatible "aptina,mt9p006m"
of_property -f -d ${ENDPOINT_PATH} link-frequencies
of_property -f -s ${ENDPOINT_PATH} input-clock-frequency <50000000>
of_property -f -s ${ENDPOINT_PATH} pixel-clock-frequency <50000000>
of_property -f -s ${ENDPOINT_PATH} pclk-sample <0>

of_fixup_status ${CAM_PATH}
""")
    env_add(d, "expansions/imx6ul-phytec-vm009",
"""#!/bin/sh
CAM_PATH="/soc/aips-bus@2100000/i2c@21a0000/cam0@48"
ENDPOINT_PATH="/soc/aips-bus@2100000/i2c@21a0000/cam0@48/port/endpoint"

of_property -f -s ${CAM_PATH} compatible "micron,mt9m111"
of_property -f -s ${CAM_PATH} clock-names "mclk"
of_property -f -s ${CAM_PATH} phytec,invert-pixclk
of_property -f -s ${CAM_PATH} phytec,allow-10bit
of_property -f -d ${ENDPOINT_PATH} link-frequencies

of_fixup_status ${CAM_PATH}
""")

    #RAUC init scripts for NAND
    env_add(d, "bin/rauc_init_nand",
"""#!/bin/sh
echo "Format /dev/nand0.root"

ubiformat -q /dev/nand0.root
ubiattach /dev/nand0.root
ubimkvol -t static /dev/nand0.root.ubi kernel0 8M
ubimkvol -t static /dev/nand0.root.ubi oftree0 1M
ubimkvol /dev/nand0.root.ubi root0 244M
ubimkvol -t static /dev/nand0.root.ubi kernel1 8M
ubimkvol -t static /dev/nand0.root.ubi oftree1 1M
ubimkvol /dev/nand0.root.ubi root1 0

ubidetach 0
""")
    env_add(d, "bin/rauc_flash_nand_from_mmc",
"""#!/bin/sh
echo "Initialize NAND flash from MMC"
[ ! -e /dev/nand0.root.ubi ] && ubiattach /dev/nand0.root
ubiupdatevol /dev/nand0.root.ubi.kernel0 /mnt/mmc0.0/zImage
ubiupdatevol /dev/nand0.root.ubi.kernel1 /mnt/mmc0.0/zImage
ubiupdatevol /dev/nand0.root.ubi.oftree0 /mnt/mmc0.0/oftree
ubiupdatevol /dev/nand0.root.ubi.oftree1 /mnt/mmc0.0/oftree
cp /mnt/mmc0.0/root.ubifs /dev/nand0.root.ubi.root0
cp /mnt/mmc0.0/root.ubifs /dev/nand0.root.ubi.root1
""")
    env_add(d, "bin/rauc_flash_nand_from_tftp",
"""#!/bin/sh
echo "Initialize NAND flash from TFTP"
[ ! -e /dev/nand0.root.ubi ] && ubiattach /dev/nand0.root
ubiupdatevol /dev/nand0.root.ubi.kernel0 /mnt/tftp/zImage
ubiupdatevol /dev/nand0.root.ubi.kernel1 /mnt/tftp/zImage
ubiupdatevol /dev/nand0.root.ubi.oftree0 /mnt/tftp/oftree
ubiupdatevol /dev/nand0.root.ubi.oftree1 /mnt/tftp/oftree
cp /mnt/tftp/root.ubifs /dev/nand0.root.ubi.root0
cp /mnt/tftp/root.ubifs /dev/nand0.root.ubi.root1
""")
}





#Currently there is no rauc support for eMMC
python do_env_append_mx6ul-comm-module() {
    env_rm(d, "boot/system0")
    env_rm(d, "boot/system1")
    env_rm(d, "nv/bootchooser.targets")
    env_rm(d, "nv/bootchooser.system0.boot")
    env_rm(d, "nv/bootchooser.system1.boot")
    env_rm(d, "nv/bootchooser.state_prefix")
    env_rm(d, "bin/rauc_flash_nand_from_mmc")
    env_rm(d, "bin/rauc_flash_nand_from_tftp")
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