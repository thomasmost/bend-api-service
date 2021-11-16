Development
---

`cargo run`

Publishing the Image
---

#### Setup

1. Install [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
2. Ensure you have access to the Container Registrar service account in GCP IAM & Admin
3. Run `gcloud auth login` using an account with access to the Container Registrar
4. Run `docker tag tcmoore/bend-api-service gcr.io/{PROJECT_ID}/api-service` (You can find the project id [here](https://console.cloud.google.com/home/dashboard))
5. Run `docker push gcr.io/bend-330614/api-service`


## DB Connectivity
Note that `bend-db` indicates the Cloud SQL instance, while `bend_db` indicates the postgres database name

### Setting up a new database

1. Create a new Postgres instance in Cloud SQL and store the root password somewhere secure
2. Wait for the instance to boot up, then connect:
3. Run `gcloud sql connect bend-db --user=postgres --project PROJECT_ID` and enter your password
4. You can now run `diesel setup`
  - Using: `DATABASE_URL=postgres://postgres:{ROOT_PASSWORD}@{YOUR_DB_PUBLIC_IP}/bend_db`

### Running migrations

1. Run `gcloud sql connect bend-db --user=postgres --project PROJECT_ID` and enter your password
2. You can now run migrations for 5 minutes with Diesel with `diesel migration run`
  - Using: `DATABASE_URL=postgres://postgres:{ROOT_PASSWORD}@{YOUR_DB_PUBLIC_IP}/bend-db`

### Connecting Cloud Run to Cloud SQL
Steps to connect to Cloud SQL from the api service in the cloud environment:

1. Ensure that a service account exists with the Cloud SQL Client permissions
2. Deploy a new revision of the Cloud Run instance with a Connection enabled (in the **Connections** tab) to the SQL instance
3. In Cloud Run, the DATABASE_URL must take a slightly different form to support the unix socket path
  - `postgres://{USER}:{PASSWORD}@?host=/cloudsql/{CLOUD_SQL_CONNECTION_NAME}&dbname=bend_db`


See [Official Docs](https://cloud.google.com/sql/docs/postgres/connect-run) for additional details.
