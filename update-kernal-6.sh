cd ./bin

wget https://github.com/CH3COOOH/CentOS-7U-Project/releases/download/main/kernal-6.6.52-centos7.tgz
tar zxvf ./kernal-6.6.52-centos7.tgz -C /
grub2-mkconfig -o /boot/grub2/grub.cfg
egrep ^menuentry /etc/grub2.cfg | cut -f 2 -d \'

echo Run \"grub2-set-default \<num\>\", \"\<num\>\" is number of the new kernal.
echo \(start from 0\)
echo And then reboot your system.