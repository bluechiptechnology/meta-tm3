DEPENDS:append:tm3 = " trusted-firmware-a"
COMPATIBLE_MACHINE:tm3 = "tm3"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI +=  "file://sun50i-h6-bct-tm3.dts;subdir=git/arch/arm/dts \
             file://tm3_defconfig;subdir=git/configs/ \
	     file://uart.patch \
	     file://boot.cmd"
	     
UBOOT_ENV_SUFFIX:tm3 = "scr"
UBOOT_ENV:tm3 = "boot"

EXTRA_OEMAKE:append:tm3 = " BL31=${DEPLOY_DIR_IMAGE}/bl31.bin SCP=/dev/null"

do_compile:tm3[depends] += "trusted-firmware-a:do_deploy"

do_compile:append:tm3() {
    ${B}/tools/mkimage -C none -A arm -T script -d ${WORKDIR}/boot.cmd ${WORKDIR}/${UBOOT_ENV_BINARY}
}
