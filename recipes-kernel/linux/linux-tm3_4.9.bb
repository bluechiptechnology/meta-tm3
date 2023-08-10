SUMMARY = "Kernel recipe for tm3"
COMPATIBLE_MACHINE:tm3 = "tm3"
KERNEL_VERSION_SANITY_SKIP = "1"

inherit kernel
require recipes-kernel/linux/linux-yocto.inc

SRC_URI = "git:///embedded/projects/tm3/lichee/linux-4.9;branch=dev;protocol=file \
           file://defconfig"

LINUX_VERSION ?= "4.9"
LINUX_VERSION_EXTENSION:append = "-custom"

SRCREV_default = "${AUTOREV}"

PV = "${LINUX_VERSION}+git${SRCPV}"

KERNEL_IMAGETYPE = "Image"
