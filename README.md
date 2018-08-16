# Docker Container for Ledger Development

## Building

```sh
docker build -t ledger-docker-bolos .
```

## Running

```sh
docker run -it --privileged -v /dev/bus/usb:/dev/bus/usb ledger-docker-bolos bash
```

## Troubleshooting

### Remove python ledgerblue module

```sh
rm -rf /usr/local/lib/python2.7/dist-packages/ledgerblue
``` 
