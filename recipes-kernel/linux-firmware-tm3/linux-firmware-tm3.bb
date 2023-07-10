LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

S = "${WORKDIR}"

COMPATIBLE_MACHINE = "tm3"

SRC_URI:append = " \
        file://ssv6x5x-wifi.cfg \
"

do_install() {
    	install -d ${D}${nonarch_base_libdir}/firmware
	install -m 0644 ${S}/ssv6x5x-wifi.cfg ${D}${nonarch_base_libdir}/firmware/ssv6x5x-wifi.cfg
}

FILES:${PN}-wifi = "${nonarch_base_libdir}/firmware/ssv6x5x-wifi.cfg"

PACKAGES = "${PN}-wifi"
