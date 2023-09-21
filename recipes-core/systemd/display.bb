LICENSE = "CLOSED"
inherit systemd

SYSTEMD_SERVICE:${PN} = "display.service"

SRC_URI += " file://display.service "
FILES:${PN} += "${systemd_unitdir}/system/display.service"

do_install:append() {
    install -d ${D}/${systemd_unitdir}/system
    install -m 0644 ${WORKDIR}/display.service ${D}/${systemd_unitdir}/system
}
