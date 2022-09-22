#!/bin/sh

echo "Database type set to $DATABASE_TYPE"
if [ "$DATABASE_TYPE" == "mysql" ]; then
    echo "Detected mysql, setting variables"
    export DATABASE_PROTOCOL=mysql
    export DATABASE_DRIVER="com.mysql.cj.jdbc.Driver"
    export DATABASE_SOCKET_FACTORY="com.google.cloud.sql.mysql.SocketFactory"
    export DATABASE_DRIVER_FILE_LOCATION=/mysql-socket-factory.jar
    export DATABASE_DRIVER_FILE_DOWNLOAD_URL=https://storage.googleapis.com/cloud-sql-java-connector/v1.7.0/mysql-socket-factory-1.7.0-jar-with-driver-and-dependencies.jar
elif [ "$DATABASE_TYPE" == "postgresql" ]; then
    echo "Detected postgresql, setting variables"
    export DATABASE_PROTOCOL=postgresql
    export DATABASE_DRIVER="org.postgresql.Driver"
    export DATABASE_SOCKET_FACTORY="com.google.cloud.sql.postgres.SocketFactory"
    export DATABASE_DRIVER_FILE_LOCATION=/postgresql-socket-factory.jar
    export DATABASE_DRIVER_FILE_DOWNLOAD_URL=https://storage.googleapis.com/cloud-sql-java-connector/v1.7.0/mysql-socket-factory-1.7.0-jar-with-driver-and-dependencies.jar
    if [ -n "$ENABLE_IAM_AUTH" ]; then
        export JDBC_URL_OPTIONS="&amp;enableIamAuth=true"
    fi
else
    echo "Database type is unset, assuming advanced variables already set"
    echo "Downloading driver file from $DATABASE_DRIVER_FILE_DOWNLOAD_URL to /socket-factory.jar"
fi

echo "Downloading driver file..."
curl -L $DATABASE_DRIVER_FILE_DOWNLOAD_URL > $DATABASE_DRIVER_FILE_LOCATION

envsubst < /opt/traccar/conf/traccar.env.xml > /opt/traccar/conf/traccar.xml

echo "/||||||||||||||||||||||\ STARTING /||||||||||||||||||||||\\"
echo ""
echo ""

exec "$@"
