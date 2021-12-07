# hassio-rtlamr-addon

A HASSIO addon to run [RTLAMR](https://github.com/bemasher/rtlamr) and [RTLAMR_COLLECT](https://github.com/bemasher/rtlamr-collect) on RTL-SDR dongles (RTL2832U). Idea is to read data from meters (water/gas/electric) and import data into InfluxDB database.

## 1. Install RTL-SDR

- Follow instructions on [OSMOCOM](https://osmocom.org/projects/rtl-sdr/wiki/Rtl-sdr) to install manually
- Install using apt-get
```
$ sudo apt-get update
$ sudo apt-get install rtl-sdr
```
- Make sure that `lsmod | grep dvb` does not show anything or may require a reboot

## 2. Run RTLAMR & RTLAMR-collect

- Add appropiate values to config and run this add on
