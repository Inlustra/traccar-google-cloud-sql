#!/bin/sh

envsubst < /opt/traccar/conf/traccar.env.xml > /opt/traccar/conf/traccar.xml

echo "/||||||||||||||||||||||\ STARTING /|||||||||||||||||||||||||\\"
echo ""
echo "Config is as follows"
echo ""
cat /opt/traccar/conf/traccar.xml
echo ""
echo ""

exec "$@"
