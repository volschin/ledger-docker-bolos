#!/bin/bash

DEST=/opt/bolos

mkdir -p ${DEST}
cd ${DEST}

wget https://launchpad.net/gcc-arm-embedded/5.0/5-2016-q3-update/+download/gcc-arm-none-eabi-5_4-2016q3-20160926-linux.tar.bz2
wget http://releases.llvm.org/4.0.0/clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz

tar xfj gcc-arm-none-eabi-5_4-2016q3-20160926-linux.tar.bz2
tar xfv clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz

rm gcc-arm-none-eabi-5_4-2016q3-20160926-linux.tar.bz2
rm clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz

mv /opt/bolos/gcc-arm-none-eabi-5_4-2016q3 /opt/bolos/gcc-arm-none-eabi-5_3-2016q1
mv clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-14.04 clang-arm-fropi
chmod 757 -R clang-arm-fropi/
chmod +x clang-arm-fropi/bin/clang

ln -s ${DEST}/gcc-arm-none-eabi-5_3-2016q1/bin/arm-none-eabi-gcc /usr/bin/arm-none-eabi-gcc
ln -s ${DEST}/clang-arm-fropi/bin/clang /usr/bin/clang

# Avoid high UID/GID that affect CircleCI
chown root:root /opt/bolos -R

#wget -O - https://www.ledgerwallet.com/support/add_udev_rules.sh | bash
#usermod -a -G plugdev vagrant

echo "export BOLOS_ENV=/opt/bolos" >> ~/.bashrc
