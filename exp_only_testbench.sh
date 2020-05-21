# exp 1
cd /home/pc/
modprobe nova wprotect=1 nova_dbgmask=1 inplace_data_updates=1
mount -t NOVA -o init /dev/pmem0 /mnt/ramdisk
cd /mnt/ramdisk
echo 0 > /proc/sys/kernel/randomize_va_space
cp /home/pc/MTP/filebench-1.5-alpha3/webproxy.f ./
sleep 60s
filebench -f webproxy.f
sleep 60s
rm -rf tmp/
cd /home/pc/
umount /mnt/ramdisk

# exp 2
cd /home/pc/
modprobe nova wprotect=1 nova_dbgmask=1 inplace_data_updates=1
mount -t NOVA -o init /dev/pmem0 /mnt/ramdisk
cd /mnt/ramdisk
echo 0 > /proc/sys/kernel/randomize_va_space
cp /home/pc/MTP/filebench-1.5-alpha3/fileserver.f ./
sleep 60s
filebench -f fileserver.f
sleep 60s
rm -rf tmp/
cd /home/pc/
umount /mnt/ramdisk

# exp 3
cd /home/pc/
modprobe nova wprotect=1 nova_dbgmask=1 inplace_data_updates=1
mount -t NOVA -o init /dev/pmem0 /mnt/ramdisk
cd /mnt/ramdisk
echo 0 > /proc/sys/kernel/randomize_va_space
cp /home/pc/MTP/filebench-1.5-alpha3/varmail.f ./
sleep 60s
filebench -f varmail.f
sleep 60s
rm -rf tmp/
cd /home/pc/
umount /mnt/ramdisk
