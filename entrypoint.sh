#!/bin/sh

envsubst < /opt/traccar/conf/traccar.env.xml > /opt/traccar/conf/traccar.xml

exec "$@"
