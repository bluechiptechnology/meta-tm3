COMPATIBLE_MACHINE = "(tm3)"

TFA_PLATFORM:tm3 = "sun50i_h6"
TFA_BUILD_TARGET = "bl31"

SRCREV_tfa = "0e04a201706346cc87a3659d4502e69751a0b3da"
SRCBRANCH = "master"

SRC_URI:remove = " \
                  file://rwx-segments.patch \
                  file://add-spmc_manifest-for-qemu.patch \
                  file://feat-qemu-update-abi-between-spmd-and-spmc.patch \
                 "

#EXTRA_OEMAKE += "SUNXI_SETUP_REGULATORS=0"
