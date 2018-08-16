#Download base ubuntu image
FROM ubuntu:14.04
RUN dpkg --add-architecture i386
RUN apt-get update && \
    apt-get -y install build-essential git wget sudo
RUN apt-get update && \
    apt-get -y install python-dev python-pip python-pil python-setuptools zlib1g-dev libjpeg-dev && \
    apt-get -y install libudev-dev libusb-1.0-0-dev && \
    apt-get -y install libc6:i386 libncurses5:i386 libstdc++6:i386 libc6-dev-i386 -y > /dev/null && \
    apt-get -y install binutils-arm-none-eabi zip

ADD install_compiler.sh /tmp/install_compiler.sh
RUN /tmp/install_compiler.sh

# Install the SDKs
RUN git clone https://github.com/hantuzun/blue-secure-sdk /opt/bolos/blue-secure-sdk
RUN git clone https://github.com/LedgerHQ/nanos-secure-sdk /opt/bolos/nanos-secure-sdk

# Volume
RUN echo "export BOLOS_SDK=/opt/bolos/blue-secure-sdk" >> ~/.bashrc

# Install https://pypi.org/project/ledgerblue
# RUN pip install -U setuptools ledgerblue
RUN git clone https://github.com/hantuzun/blue-loader-python /opt/bolos/blue-loader-python
RUN python /opt/bolos/blue-loader-python/setup.py install

# Giving permissions on udev
RUN SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0000", MODE="0660", TAG+="uaccess", TAG+="udev-acl" OWNER="root"
RUN SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0001", MODE="0660", TAG+="uaccess", TAG+="udev-acl" OWNER="root"


RUN adduser -u 1000 test
