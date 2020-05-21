# exp 1
cd /home/pc/
modprobe nova wprotect=1 inplace_data_updates=1
mount -t NOVA -o init /dev/pmem0 /mnt/ramdisk
cd /mnt/ramdisk
echo 0 > /proc/sys/kernel/randomize_va_space
cp /home/pc/MTP/filebench-1.5-alpha3/webproxy.f ./
filebench -f webproxy.f
rm -rf tmp/
cd /home/pc/
umount /mnt/ramdisk
sleep 120s

# exp 2
cd /home/pc/
modprobe nova wprotect=1 inplace_data_updates=1
mount -t NOVA -o init /dev/pmem0 /mnt/ramdisk
cd /mnt/ramdisk
echo 0 > /proc/sys/kernel/randomize_va_space
cp /home/pc/MTP/filebench-1.5-alpha3/fileserver.f ./
filebench -f fileserver.f
rm -rf tmp/
cd /home/pc/
umount /mnt/ramdisk
sleep 120s

# exp 3
cd /home/pc/
modprobe nova wprotect=1 inplace_data_updates=1
mount -t NOVA -o init /dev/pmem0 /mnt/ramdisk
cd /mnt/ramdisk
echo 0 > /proc/sys/kernel/randomize_va_space
cp /home/pc/MTP/filebench-1.5-alpha3/varmail.f ./
filebench -f varmail.f
rm -rf tmp/
cd /home/pc/
umount /mnt/ramdisk
