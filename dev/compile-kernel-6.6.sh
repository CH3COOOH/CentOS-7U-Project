#!/bin/bash
set -e

KVER=${KVER:-6.6.52}
JOBS=${JOBS:-$(nproc)}

echo "[1/5] Install Dev tools..."
yum groupinstall -y "Development Tools"
yum install -y ncurses-devel openssl-devel elfutils-libelf-devel bc flex bison

echo "[2/5] Downloading kernel source codes..."
cd /usr/src
# curl -LO https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-$KVER.tar.xz
tar -xf linux-$KVER.tar.xz
cd linux-$KVER

echo "[3/5] Generating configure..."
cp -v /boot/config-$(uname -r) .config || true
yes "" | make oldconfig

echo "[4/5] Compiling kernal and modules..."
make -j"$JOBS"
make -j"$JOBS" modules

# echo "[5/5] Installing kernal..."
# make modules_install
# make install
# grub2-mkconfig -o /boot/grub2/grub.cfg

# echo "Done. Please reboot."