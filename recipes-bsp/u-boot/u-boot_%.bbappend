COMPATIBLE_MACHINE:tm3 = "tm3"

LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"
UBOOT_MACHINE = "tm3_config"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI = "git://git@github.com/bluechiptechnology/u-boot-tm3.git;branch=main;protocol=ssh \
           file://sun50i-h6-bct-tm3.dts;subdir=git/arch/arm/dts \
           file://tm3_defconfig;subdir=git/configs/ \
           file://scpfelsram.fex \
           file://bl31.bin \
           file://boot.cmd"
SRCREV = "288e8930bbbb0213562e736234664711f55d8b5b"

# Added a patch to a Makefile so it builds a dtb from our dts 
# https://e2e.ti.com/support/processors-group/processors/f/processors-forum/918932/compiler-am3352-yocto-u-boot-staging-build-failing-for-device-tree-source-is-not-correctly-specified
# only seems necessary in Kirkstone, didn't seem to need to do this
# in Mickledore 

UBOOT_ENV_SUFFIX:tm3 = "scr"
UBOOT_ENV:tm3 = "boot"

EXTRA_OEMAKE:append:tm3 = " BL31=${WORKDIR}/bl31.bin SCP=${WORKDIR}/scpfelsram.fex"

do_compile:append:tm3() {
    ${B}/tools/mkimage -C none -A arm -T script -d ${WORKDIR}/boot.cmd ${WORKDIR}/${UBOOT_ENV_BINARY}
}
