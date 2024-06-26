inherit tm3

COMPATIBLE_MACHINE:tm3 = "tm3"

LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"
UBOOT_MACHINE = "tm3_config"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI = "git://github.com/bluechiptechnology/u-boot-tm3.git;branch=32bit-ram;protocol=https \
           file://tm3_defconfig;subdir=git/configs/ \
           file://gcc-linaro-11.3.1-2022.06-x86_64_arm-linux-gnueabihf.tar.xz \
           file://boot.cmd"
SRCREV = "55e3f8394fb80b650745106fd34623e70a050bd4"

# Added a patch to a Makefile so it builds a dtb from our dts 
# https://e2e.ti.com/support/processors-group/processors/f/processors-forum/918932/compiler-am3352-yocto-u-boot-staging-build-failing-for-device-tree-source-is-not-correctly-specified
# only seems necessary in Kirkstone, didn't seem to need to do this
# in Mickledore 

UBOOT_ENV_SUFFIX:tm3 = "scr"
UBOOT_ENV:tm3 = "boot"
TARGET_PREFIX = "${WORKDIR}/gcc-linaro-11.3.1-2022.06-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-"

do_compile:append:tm3() {
    ${B}/tools/mkimage -C none -A arm -T script -d ${WORKDIR}/boot.cmd ${WORKDIR}/${UBOOT_ENV_BINARY}
}
