SUMMARY = "Kernel recipe for tm3"
COMPATIBLE_MACHINE:tm3 = "tm3"
KERNEL_VERSION_SANITY_SKIP = "1"

inherit kernel
require recipes-kernel/linux/linux-yocto.inc

SRC_URI = "git://github.com/bluechiptechnology/linux-tm3.git;branch=ramchanges;protocol=https\
           file://defconfig"
SRCREV = "1fbd5e0a9334cd5e87e058300534df3b69895d2c"

LINUX_VERSION ?= "4.9"
LINUX_VERSION_EXTENSION:append = "-custom"

PV = "${LINUX_VERSION}+git${SRCPV}"

KERNEL_IMAGETYPE = "Image"
