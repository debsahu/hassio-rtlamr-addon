# hassio-rtlamr-addon

A HASSIO addon to run [RTLAMR](https://github.com/bemasher/rtlamr) and [RTLAMR_COLLECT](https://github.com/bemasher/rtlamr-collect) on RTL-SDR dongles (RTL2832U). Idea is to read data from meters (water/gas/electric) and import data into InfluxDB database.

## Assumption

- [InfluxDB add-on](https://github.com/hassio-addons/addon-influxdb) has been installed
- In InfluxDB admin:
  - Create a database 'rtlamr'
  - Create a user 'rtlamr' and password 'rtlamr' with read/write access to rtlamr database
  - Feel free to use any values for above and update the config page with appropiate values

## 1. Plug RTL-SDR (RTL2832U) into USB

- Plug RTL-SDR (RTL2832U) dongle into USB port

## 2. Run RTLAMR & RTLAMR-collect Add-on

- Goto "Supervisor" -> "Add-ons Store" -> "Menu (top left)" -> "Repositories" -> "Add"
- Add this add-on repository:

```
https://github.com/debsahu/hassio-rtlamr-addon
```

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
```

## Home Assistant

- Setup a sensor in configuration.yaml with appropiate endpoint_id value (meter id)

```yaml
- platform: influxdb
  host: a0d7b954-influxdb
  username: rtlamr
  password: rtlamr
  queries:
    - name: Water Consumption
      unit_of_measurement: gal
      measurement: '"rtlamr"."autogen"."rtlamr"'
      value_template: "{{ value | round(1) / 100 }}"
      where: '"endpoint_id" = ''123456890'''
      database: rtlamr
      group_function: last
      field: consumption
```