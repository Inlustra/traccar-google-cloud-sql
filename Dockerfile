
FROM traccar/traccar:5-alpine
ENV DEFAULT_FILE_LOCATION /opt/traccar/conf/default.xml
RUN apk --no-cache add curl gettext

ENV LOG_LEVEL info
ENV DATABASE_TYPE mysql
ENV JDBC_URL_OPTIONS ""

COPY entrypoint.sh /entrypoint.sh
COPY ./traccar.env.xml /opt/traccar/conf/traccar.env.xml

CMD ["java", "-Xms1g", "-Xmx1g", "-Djava.net.preferIPv4Stack=true", "--add-opens", "jdk.zipfs/jdk.nio.zipfs=ALL-UNNAMED", "--add-opens", "java.base/jdk.internal.loader=ALL-UNNAMED", "-jar", "tracker-server.jar", "/opt/traccar/conf/traccar.xml"]

ENTRYPOINT ["/entrypoint.sh"]
