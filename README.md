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

## Connecting to the DB locally

1. Run `gcloud sql connect bend-db --user=postgres --project PROJECT_ID`
2. You can now run migrations for 5 minutes with Diesel
  - Using: `DATABASE_URL=postgres://postgres:root@{YOUR_DB_PUBLIC_IP}/bend-db`
