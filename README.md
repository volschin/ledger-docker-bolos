# Docker Container for Ledger Development

## Building

```sh
docker build -t ledger-docker-bolos .
```

## Running

Below is how you could run the image and mount USB devices for Ubuntu:

```sh
docker run -it --privileged -v /dev/bus/usb:/dev/bus/usb ledger-docker-bolos bash
```

You could mount project directories into the running image like the example below:

```sh
BLUE_SAMPLE_APPS_DIR=/home/${USER}/repos/blue-sample-apps
BLUE_SECURE_SDK_DIR=/home/${USER}/repos/blue-secure-sdk
NANOS_SECURE_SDK_DIR=/home/${USER}/repos/nanos-secure-sdk
docker run -it --privileged \
           -v /dev/bus/usb:/dev/bus/usb \
           -v ${BLUE_SAMPLE_APPS_DIR}:/root/blue-sample-apps \
           -v ${BLUE_SECURE_SDK_DIR}:/opt/bolos/blue-secure-sdk \
           -v ${NANOS_SECURE_SDK_DIR}:/opt/bolos/nanos-secure-sdk \
           ledger-docker-bolos bash
```

## Troubleshooting

### Remove python ledgerblue module

```sh
rm -rf /usr/local/lib/python2.7/dist-packages/ledgerblue
``` 
