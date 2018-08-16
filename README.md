# Docker Container for Ledger Development

## Building

```sh
docker build -t ledger-docker-bolos .
```

## Running

```sh
docker run -it --privileged -v /dev/bus/usb:/dev/bus/usb ledger-docker-bolos bash
```

You could mount project directories into Docker like the example below:

```sh
sudo docker run -it --privileged -v /dev/bus/usb:/dev/bus/usb -v ${LOCAL_BLUE_SAMPLE_APPS_DIR}:/root/blue-sample-apps ledger-docker-bolos bash
```

## Troubleshooting

### Remove python ledgerblue module

```sh
rm -rf /usr/local/lib/python2.7/dist-packages/ledgerblue
``` 
