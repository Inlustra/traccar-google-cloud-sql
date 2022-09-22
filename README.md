# Traccar with built in Google Cloud SQL MySQL & Postgresql connectors

 Perfect for Cloud Run as the Traccar config file has been replaced with environment variables.

[![Run on Google Cloud](https://deploy.cloud.run/button.svg)](https://deploy.cloud.run)

## How to use

You can simply run the Docker image: `inlustra/traccar-google-cloud-sql` with the required env vars below.

It will default to the Google Cloud SQL MySQL connector, if you are using MySQL, the only env vars required are:

- DATABASE_USERNAME
- DATABASE_PASSWORD
- DATABASE_NAME
- CONNECTION_NAME


## Possible environment variables:

| Name                    | Description                                                                                                                                                                                                                                                                                                  | Required |
| :---------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------- |
| DATABASE_USERNAME       | Cloud SQL database user                                                                                                                                                                                                                                                                                      | true     |
| DATABASE_PASSWORD       | Cloud SQL database password                                                                                                                                                                                                                                                                                  | true     |
| DATABASE_NAME           | Cloud SQL database name                                                                                                                                                                                                                                                                                      | true     |
| CONNECTION_NAME         | Go to your Cloud SQL page, create a database and copy the &#x27;Connection Name&#x27;, it looks something like: myproject:mylocation:mydbname                                                                                                                                                                          | true     |
| DATABASE_TYPE           | Used to auto configure the advanced variables, supported options are: &#x27;mysql&#x27; (Default), &#x27;postgresql&#x27; or &#x27;custom&#x27; (Advanced)                                                                                                                                                                                 | false    |
| DATABASE_PROTOCOL       | Advanced, if DATABASE_TYPE is set to custom, used to manually create JDBC url                                                                                                                                                                                                                                | false    |
| DATABASE_DRIVER         | Advanced, if DATABASE_TYPE is set to custom, you can only use those drivers supported by Traccar or loaded via DRIVER_FILE                                                                                                                                                                                   | false    |
| DATABASE_SOCKET_FACTORY | Advanced, if DATABASE_TYPE is set to custom, allows loading a custom socket factory via JDBC url                                                                                                                                                                                                             | false    |
| ENABLE_IAM_AUTH         | Used to set enableIamAuth on postgresql socket connections                                                                                                                                                                                                                                                   | false    |
| JDBC_URL_OPTIONS        | Advanced, if DATABASE_TYPE is set to custom, You can use this to append to the JDBC URL, the default URL is: &#x27;jdbc:${DATABASE_TYPE}:///${DATABASE_NAME}?socketFactory&#x3D;${DATABASE_SOCKET_FACTORY}&amp;amp;cloudSqlInstance&#x3D;${CONNECTION_NAME}&amp;amp;unixSocketPath&#x3D;/cloudsql/${CONNECTION_NAME}${JDBC_URL_OPTIONS}&#x27; | false    |


### Note

- You'll notice that the & symbols have been escaped - Remember, for the username and password you'll have to do the same (I'd recommend avoiding any XML-escape-required characters)