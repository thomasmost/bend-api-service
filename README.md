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