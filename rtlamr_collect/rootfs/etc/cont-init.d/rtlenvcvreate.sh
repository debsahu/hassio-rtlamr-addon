#!/usr/bin/with-contenv bashio

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

RTLAMR_MSGTYPE=$(bashio::config 'RTLAMR_MSGTYPE')
RTLAMR_CENTERFREQ=$(bashio::config 'RTLAMR_CENTERFREQ')
COLLECT_INFLUXDB_HOSTNAME=$(bashio::config 'COLLECT_INFLUXDB_HOSTNAME')
COLLECT_INFLUXDB_DATABASE=$(bashio::config 'COLLECT_INFLUXDB_DATABASE')
COLLECT_INFLUXDB_TOKEN=$(bashio::config 'COLLECT_INFLUXDB_TOKEN')
COLLECT_INFLUXDB_ORG=$(bashio::config 'COLLECT_INFLUXDB_ORG')
COLLECT_INFLUXDB_BUCKET=$(bashio::config 'COLLECT_INFLUXDB_BUCKET')
COLLECT_INFLUXDB_MEASUREMENT=$(bashio::config 'COLLECT_INFLUXDB_MEASUREMENT')
COLLECT_STRICTIDM=$(bashio::config 'COLLECT_STRICTIDM')

bashio::log.info "Seeing if /config/rtlamr-collect.env exists"
if ! bashio::fs.file_exists "/config/rtlamr-collect.env"; then
    bashio::log.info "Overwriting /config/rtlamr-collect.env"
else
    bashio::log.info "Creating /config/rtlamr-collect.env"
fi

echo -e "RTLAMR_FORMAT=json" > /config/rtlamr-collect.env
echo -e "RTLAMR_MSGTYPE=${RTLAMR_MSGTYPE}" >> /config/rtlamr-collect.env
echo -e "RTLAMR_CENTERFREQ=${RTLAMR_CENTERFREQ}" >> /config/rtlamr-collect.env
if bashio::config.has_value 'RTLAMR_FILTERID'; then
    RTLAMR_FILTERID=$(bashio::config 'RTLAMR_FILTERID')
    echo -e "RTLAMR_FILTERID=${RTLAMR_FILTERID}" >> /config/rtlamr-collect.env
fi
echo -e "COLLECT_INFLUXDB_HOSTNAME=${COLLECT_INFLUXDB_HOSTNAME}" >> /config/rtlamr-collect.env
echo -e "COLLECT_INFLUXDB_DATABASE=${COLLECT_INFLUXDB_DATABASE}" >> /config/rtlamr-collect.env
echo -e "COLLECT_INFLUXDB_TOKEN=${COLLECT_INFLUXDB_TOKEN}" >> /config/rtlamr-collect.env
echo -e "COLLECT_INFLUXDB_ORG=${COLLECT_INFLUXDB_ORG}" >> /config/rtlamr-collect.env
echo -e "COLLECT_INFLUXDB_BUCKET=${COLLECT_INFLUXDB_BUCKET}" >> /config/rtlamr-collect.env
echo -e "COLLECT_INFLUXDB_MEASUREMENT=${COLLECT_INFLUXDB_MEASUREMENT}" >> /config/rtlamr-collect.env
echo -e "COLLECT_STRICTIDM=${COLLECT_STRICTIDM}" >> /config/rtlamr-collect.env