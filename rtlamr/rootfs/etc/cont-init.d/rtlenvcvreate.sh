#!/usr/bin/env bashio

declare -a options
declare RTLAMR_MSGTYPE
declare RTLAMR_CENTERFREQ
declare RTLAMR_FILTERID
declare COLLECT_INFLUXDB_HOSTNAME
declare COLLECT_INFLUXDB_DATABASE
declare COLLECT_INFLUXDB_TOKEN
declare COLLECT_INFLUXDB_ORG
declare COLLECT_INFLUXDB_BUCKET
declare COLLECT_INFLUXDB_MEASUREMENT
declare COLLECT_STRICTIDM

RTLAMR_MSGTYPE = $(bashio::config 'RTLAMR_MSGTYPE')
RTLAMR_CENTERFREQ = $(bashio::config 'RTLAMR_CENTERFREQ')
RTLAMR_FILTERID = $(bashio::config 'RTLAMR_FILTERID')
COLLECT_INFLUXDB_HOSTNAME = $(bashio::config 'COLLECT_INFLUXDB_HOSTNAME')
COLLECT_INFLUXDB_DATABASE = $(bashio::config 'COLLECT_INFLUXDB_DATABASE')
COLLECT_INFLUXDB_TOKEN = $(bashio::config 'COLLECT_INFLUXDB_TOKEN')
COLLECT_INFLUXDB_ORG = $(bashio::config 'COLLECT_INFLUXDB_ORG')
COLLECT_INFLUXDB_BUCKET = $(bashio::config 'COLLECT_INFLUXDB_BUCKET')
COLLECT_INFLUXDB_MEASUREMENT = $(bashio::config 'COLLECT_INFLUXDB_MEASUREMENT')
COLLECT_STRICTIDM = $(bashio::config 'COLLECT_STRICTIDM')

bashio::log.info "Seeing if /config/rtlamr-collect.env exists"

if ! bashio::fs.file_exists "/config/rtlamr-collect.env"; then
    bashio::log.info "Creating /config/rtlamr-collect.env"
    echo -e "RTLAMR_FORMAT=json\n" > /config/rtlamr-collect.env
    echo -e "RTLAMR_MSGTYPE=${RTLAMR_MSGTYPE}\n" >> /config/rtlamr-collect.env
    echo -e "RTLAMR_CENTERFREQ=${RTLAMR_CENTERFREQ}\n" >> /config/rtlamr-collect.env
    if bashio::config.has_value 'RTLAMR_FILTERID'; then
        echo -e "RTLAMR_FILTERID=${RTLAMR_FILTERID}\n" >> /config/rtlamr-collect.env
    fi
    echo -e "COLLECT_INFLUXDB_HOSTNAME=${COLLECT_INFLUXDB_HOSTNAME}\n" >> /config/rtlamr-collect.env
    echo -e "COLLECT_INFLUXDB_DATABASE=${COLLECT_INFLUXDB_DATABASE}\n" >> /config/rtlamr-collect.env
    echo -e "COLLECT_INFLUXDB_TOKEN=${COLLECT_INFLUXDB_TOKEN}\n" >> /config/rtlamr-collect.env
    echo -e "COLLECT_INFLUXDB_ORG=${COLLECT_INFLUXDB_ORG}\n" >> /config/rtlamr-collect.env
    echo -e "COLLECT_INFLUXDB_BUCKET=${COLLECT_INFLUXDB_BUCKET}\n" >> /config/rtlamr-collect.env
    echo -e "COLLECT_INFLUXDB_MEASUREMENT=${COLLECT_INFLUXDB_MEASUREMENT}\n" >> /config/rtlamr-collect.env
    echo -e "COLLECT_STRICTIDM=${COLLECT_STRICTIDM}\n" >> /config/rtlamr-collect.env
fi