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

## 2. Run rtl_tcp as a service at boot

- Create TCP service `sudo vi /etc/systemd/system/rtl_tcp.service`
```
[Unit]
Description=Software Defined Radio TCP Server
Wants=network.target
After=network.target

[Service]
ExecStart=/usr/local/bin/rtl_tcp
Restart=always

[Install]
WantedBy=multi-user.target
```
- Enable service
```
$ sudo systemctl enable rtl_tcp.service
```
- Start rtl_tcp
```
$ sudo systemctl start rtl_tcp.service
```

## 3. Run RTLAMR & RTLAMR-collect

- Add appropiate values to config and run this add on
