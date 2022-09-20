Traccar with the built in cloud sql connectors, also example config files.

This can now just be run in Cloud run, with the follow params: 

- DATABASE_JDBC_URL: jdbc:mysql:///<DATABASE_NAME>?socketFactory=com.google.cloud.sql.mysql.SocketFactory&amp;cloudSqlInstance=<INSTANCE_NAME>&amp;unixSocketPath=/cloudsql/<INSTANCE_NAME>
- DATABASE_USERNAME
- DATABASE_PASSWORD

A couple of things to note: 

- You'll notice that the & symbols have been escaped - Remember, for the username and password you'll have to do the same (I'd recommend avoiding any XML-escape-required characters)