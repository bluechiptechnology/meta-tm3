load mmc ${mmc_bootdev}:1 ${fdt_addr_r} tm3-hb8-7-c.dtb

regulator dev vcc-ac200
regulator value 3300000
regulator enable
regulator dev vcc-3v3-1
regulator value 3300000
regulator enable
regulator dev vcc-wifi-1
regulator value 3300000
regulator enable
regulator dev vcc-wifi-2
regulator value 3300000
regulator enable
regulator dev sw
regulator enable
regulator dev vcc-dcxoio
regulator value 1800000
regulator enable

setenv resin_kernel_load_addr ${kernel_addr_r}
run resin_set_kernel_root
env set bootargs "${bootargs} ${resin_kernel_root} loglevel=7 console=ttyS0 console=tty1 earlyprintk=serial,ttyS0,115200 rootwait"
load ${resin_dev_type} ${resin_dev_index}:${resin_root_part} ${resin_kernel_load_addr} /boot/Image
booti ${resin_kernel_load_addr} - ${fdt_addr_r}
