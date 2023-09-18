load mmc ${mmc_bootdev}:1 ${fdt_addr_r} tm3-hb8-7-c.dtb
load mmc ${mmc_bootdev}:1 ${kernel_addr_r} Image

rootdev=mmcblk0p2
setenv bootargs console=${console} console=tty1 root=/dev/${rootdev} rootwait
booti ${kernel_addr_r} - ${fdt_addr_r}
