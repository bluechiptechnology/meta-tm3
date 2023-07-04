card="/dev/sdb"

#sudo dd if=/dev/zero of=${card} bs=10M count=1

sync 

#sudo dd if=/home/chris/Downloads/u-boot-sunxi-with-spl.bin of=${card} bs=1024 seek=8

#sync

#exit
#sudo dd if=/home/chris/Desktop/uboot/build/u-boot-sunxi-with-spl.bin of=${card} bs=1024 seek=8

sudo dd if=/home/chris/Repositories/yocto-test/poky/build/tmp/work/tm3-poky-linux/u-boot/1_2023.01-r0/build/u-boot-sunxi-with-spl.bin of=${card} bs=1024 seek=8
#sudo dd if=/home/chris/Repositories/yocto-test/poky/build/tmp/work/tm3-poky-linux/u-boot/1_2023.01-r0/build/spl/sunxi-spl.bin of=${card} bs=1024 seek=8
#sudo dd if=/home/chris/Repositories/yocto-test/poky/build/tmp/work/tm3-poky-linux/u-boot/1_2023.01-r0/build/spl/u-boot-spl.bin of=${card} bs=1024 seek=8


#sudo dd if=/home/chris/Repositories/yocto-test/poky/build/tmp/deploy/images/tm3/u-boot-tm3-2023.01-r0.bin of=${card} bs=1024 seek=8  #32

sync 

#sudo blockdev --rereadpt ${card}
#cat <<EOT | sudo sfdisk ${card}
#1M,32M,c
#,,L
#EOT

#sync 

#sudo mkfs.vfat ${card}1
#sudo mkfs.ext4 ${card}2

