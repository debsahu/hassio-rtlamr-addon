# hassio-rtlamr-addon

A HASSIO addon to run [RTLAMR](https://github.com/bemasher/rtlamr) and [RTLAMR_COLLECT](https://github.com/bemasher/rtlamr-collect) on RTL-SDR dongles (RTL2832U). Idea is to read data from meters (water/gas/electric) and import data into InfluxDB database.

## 1. Install RTL-SDR

- Follow instructions on [OSMOCOM](https://osmocom.org/projects/rtl-sdr/wiki/Rtl-sdr) to install manually
- Install using apt-get

```bash
$ sudo apt-get update
$ sudo apt-get install rtl-sdr
```
- Make sure that `lsmod | grep dvb` does not show anything or may require a reboot

## 2. Run RTLAMR & RTLAMR-collect

- Add appropiate values to config and run this add on

Example Add-on configuration:

```yaml
RTLAMR_MSGTYPE: r900
RTLAMR_CENTERFREQ: 917000000
COLLECT_INFLUXDB_HOSTNAME: http://a0d7b954-influxdb:8086/
COLLECT_INFLUXDB_DATABASE: rtlamr
COLLECT_INFLUXDB_TOKEN: rtlamr:rtlamr
COLLECT_INFLUXDB_ORG: doesnotmeananything
COLLECT_INFLUXDB_BUCKET: rtlamr
COLLECT_INFLUXDB_MEASUREMENT: rtlamr
COLLECT_STRICTIDM: 1
RTL_TCP_SERVER: 127.0.0.1:1234
```