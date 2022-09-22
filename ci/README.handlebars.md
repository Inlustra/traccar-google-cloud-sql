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

{{envVars}}

### Note

- You'll notice that the & symbols have been escaped - Remember, for the username and password you'll have to do the same (I'd recommend avoiding any XML-escape-required characters)
