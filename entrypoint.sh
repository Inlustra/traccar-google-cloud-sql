#!/bin/sh

if [ -n "$DATABASE_TYPE" ]; then
    echo "Database type set to $DATABASE_TYPE"
    if [ "$DATABASE_TYPE" == "mysql" ]; then
        echo "Detected mysql, setting variables"
        export DATABASE_PROTOCOL=mysql
        export DATABASE_DRIVER="com.mysql.cj.jdbc.Driver"
        export DATABASE_SOCKET_FACTORY="com.google.cloud.sql.mysql.SocketFactory"
        export DATABASE_DRIVER_FILE_LOCATION=/mysql-socket-factory.jar
    elif [ "$DATABASE_TYPE" == "postgresql" ]; then
        echo "Detected postgresql, setting variables"
        export DATABASE_PROTOCOL=postgresql
        export DATABASE_DRIVER="org.postgresql.Driver"
        export DATABASE_SOCKET_FACTORY="com.google.cloud.sql.postgres.SocketFactory"
        export DATABASE_DRIVER_FILE_LOCATION=/postgres-socket-factory.jar
        if [ -n "$ENABLE_IAM_AUTH" ]; then
            export JDBC_URL_OPTIONS="&amp;enableIamAuth=true"
        fi
    fi
else
    echo "Database type is unset, assuming advanced variables already set."
fi

envsubst < /opt/traccar/conf/traccar.env.xml > /opt/traccar/conf/traccar.xml

echo "/||||||||||||||||||||||\ STARTING /|||||||||||||||||||||||||\\"
echo ""
echo "Config is as follows"
echo ""
cat /opt/traccar/conf/traccar.xml
echo ""
echo ""

exec "$@"
