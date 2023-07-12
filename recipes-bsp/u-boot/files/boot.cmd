load mmc 0:1 ${fdt_addr_r} tm3-hb8-7-c.dtb

setenv resin_kernel_load_addr ${kernel_addr_r}
run resin_set_kernel_root
env set bootargs "${bootargs} ${resin_kernel_root} rootwait"
load ${resin_dev_type} ${resin_dev_index}:${resin_root_part} ${resin_kernel_load_addr} /boot/Image
booti ${resin_kernel_load_addr} - ${fdt_addr_r}
